package com.liquidenthusiasm.timer {
import asunit.framework.TestCase;

import flash.utils.Timer;

import org.flixel.FlxG;
import org.flixel.FlxTimer;

public class EndEarlyOnInputTimerTest extends TestCase {

    [Test]
    public function canRunOutNormalTimeWithNoInput() {
        var callbackCalled = false;
        var callback = function() { callbackCalled = true; };
        var timer:EndEarlyOnInputTimer = new EndEarlyOnInputTimer();
        timer.start(1, 1, callback);
        FlxG.elapsed = 0.99;
        timer.update();
        assertFalse("Expected callback to not have been called", callbackCalled);
        FlxG.elapsed = 0.1;
        timer.update();
        assertTrue("Expected callback to be called", callbackCalled);
    }

    [Test]
    public function canStopEarlyWithNoInput() {
        var callbackCalled = false;
        var callback = function() { callbackCalled = true; };
        var timer:EndEarlyOnInputTimer = new EndEarlyOnInputTimer();
        timer.start(1, 1, callback);
        FlxG.elapsed = 0.5;
        FlxG.mouse.handleMouseDown(null);
        timer.update();
        FlxG.mouse.handleMouseUp(null);
        assertTrue("Expected callback to have been called", callbackCalled);
    }

    [Test]
    public function callbackOnlyCalledOnceWhenTimeAndInputCoincide() {
        var callbackCalled = 0;
        var callback = function() { callbackCalled += 1; };
        var timer:EndEarlyOnInputTimer = new EndEarlyOnInputTimer();
        timer.start(1, 1, callback);
        FlxG.elapsed = 1.1;
        FlxG.mouse.handleMouseDown(null);
        timer.update();
        FlxG.mouse.handleMouseUp(null);
        assertEquals("Expected callback to have been called only once", 1, callbackCalled);
    }

}
}
