/**
 * Created with IntelliJ IDEA.
 * User: khobbs
 * Date: 5/14/14
 * Time: 1:06 PM
 * To change this template use File | Settings | File Templates.
 */
package com.liquidenthusiasm.engine.scene {
import org.flixel.FlxBasic;
import org.flixel.FlxGroup;

public class LinearScene extends FlxGroup implements Scene {
    internal var _frames:Array;
    internal var _frameIdx:int;
    private var _paused:Boolean;
    public var finished:Boolean;

    public function LinearScene() {
        _frames = [];
        _frameIdx = 0;
        finished = false;
    }

    public override function destroy():void {
        super.destroy();
        _frames = null;
        finished = true;
    }

    public function addFrames(...frames) {
        for each(var frame in frames) {
            if(frame is Array) {
                _frames = _frames.concat(frame);
            } else {
                _frames.push(frame);
            }
        }
    }

    public function nextFrame(frameIdx:*=null):void {
        if(frameIdx == null) {
            frameIdx = _frameIdx + 1;
        }
    }

    public function endScene():void {
    }

    public function get paused():Boolean {
        return this._paused;
    }

    public function set paused(paused:Boolean):void {
        this._paused = paused;
    }

    public override function update():void {
        super.update();
        while(!paused && !finished && _frames) {
            if(_frameIdx < _frames.length) {
                var frameFn = _frames[_frameIdx++];
                if(frameFn.length == 1) {
                    frameFn(this);
                } else {
                    frameFn();
                }
            } else {
                finished = true;
            }
        }
    }
}
}
