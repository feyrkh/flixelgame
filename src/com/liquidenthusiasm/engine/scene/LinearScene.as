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

    public function LinearScene() {
        _frames = [];
        _frameIdx = 0;
    }

    public function addFrames(...frames) {
        for each(var frame in frames) {
            if(frame is Array) {
                _frames = _frames.concat(frames);
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
        while(_frameIdx < _frames.length && !paused) {
            var frameFn = _frames[_frameIdx++];
            frameFn(this);
        }
        super.update();
    }
}
}
