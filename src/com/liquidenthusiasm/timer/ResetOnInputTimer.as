package com.liquidenthusiasm.timer {
import org.flixel.FlxG;

/**
 * Special timer that can be used to detect when no input has been received in a while. It will reset
 * if the mouse or keyboard is clicked while it is running. This can be used for things like timeouts
 * for an 'attract' mode on a main menu.
 *
 */
public class ResetOnInputTimer extends SimpleTimer {
    public override function update():void {
        if(FlxG.mouse.pressed() || FlxG.keys.any()) {
            this.reset();
        } else {
            super.update();
        }
    }
}
}
