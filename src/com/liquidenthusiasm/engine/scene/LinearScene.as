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
            frameIdx = _frameIdx;
        }
        paused = false;
        _frameIdx = frameIdx + 1;
    }

    public function endScene():void {
        if(!finished) {
            finished = true;
            if(_frames && _frames.length) {
                _frameIdx = _frames.length - 1;

            }
        }
        this.finished = true;
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
                runFrame();
            } else {
                finished = true;
            }
        }
    }

    private function runFrame(idx:int = -1):void {
        if(idx < 0) {
            idx = _frameIdx;
        }
        _frameIdx = idx+1;
        var frameFn = _frames[idx];
        if(frameFn) {
            if(frameFn.length == 1) {
                frameFn(this);
            } else {
                frameFn();
            }
        }
    }
}
}
