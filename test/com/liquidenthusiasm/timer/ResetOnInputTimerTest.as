package com.liquidenthusiasm.timer {
import asunit.framework.TestCase;

import flash.utils.Timer;

import org.flixel.FlxG;
import org.flixel.FlxTimer;

public class ResetOnInputTimerTest extends TestCase {
    [Test]
    public function canRunClockOutWithNoInput() {
        var callbackCalled = false;
        var callback = function() { callbackCalled = true; };
        var timer:ResetOnInputTimer = new ResetOnInputTimer();
        timer.start(1, 1, callback);
        FlxG.elapsed = 1;
        timer.update();
        assertTrue("Expected callback to be called", callbackCalled);
    }

    [Test]
    public function canResetClockOutWithMouseInput() {
        var callbackCalled = false;
        var callback = function() { callbackCalled = true; };
        var timer:ResetOnInputTimer = new ResetOnInputTimer();
        timer.start(1, 1, callback);
        FlxG.elapsed = 0.6;
        timer.update();
        FlxG.mouse.handleMouseDown(null);
        timer.update();
        FlxG.mouse.handleMouseUp(null);
        timer.update();
        assertFalse("Expected callback to not have been called", callbackCalled);
        FlxG.mouse.handleMouseDown(null);
        timer.update();
        FlxG.mouse.handleMouseUp(null);
        FlxG.mouse.handleMouseDown(null);
        timer.update();
        FlxG.mouse.handleMouseUp(null);
        assertFalse("Expected callback to not have been called", callbackCalled);
        timer.update();
        timer.update();
        assertTrue("Expected callback to be called", callbackCalled);
    }
}
}
