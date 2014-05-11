package com.liquidenthusiasm.timer {
import org.flixel.FlxG;
import org.flixel.FlxTimer;

/**
 * Special timer that can be used to detect when no input has been received in a while. It will reset
 * if the mouse or keyboard is clicked while it is running. This can be used for things like timeouts
 * for an 'attract' mode on a main menu.
 *
 */
public class SimpleTimer extends FlxTimer {
    public override function start(Time:Number=1,Loops:uint=1,Callback:Function=null):FlxTimer {
        var newCallback:Function = Callback;
        if(Callback != null && Callback.length == 0) {
            newCallback = function(t:FlxTimer):void {
                Callback();
            }
        }
        return super.start(Time, Loops, newCallback);
    }

    public function reset():FlxTimer {
        _timeCounter = 0;
        return this;
    }
}
}
