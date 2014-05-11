package com.liquidenthusiasm.timer {
import asunit.framework.TestCase;

import flash.utils.Timer;

import org.flixel.FlxG;
import org.flixel.FlxTimer;

public class SimpleTimerTest extends TestCase {

    [Test]
    public function canUseWithNoArgCallback() {
        var callbackCalled = false;
        var callback = function() { callbackCalled = true; };
        var timer:SimpleTimer = new SimpleTimer();
        timer.start(1, 1, callback);
        FlxG.elapsed = 1;
        timer.update();
        assertTrue("Expected callback to be called", callbackCalled);
    }

    [Test]
    public function canUseWithArgCallback() {
        var callbackCalled = false;
        var callbackArg = null;
        var callback = function(t:FlxTimer) {
            callbackArg = t;
            callbackCalled = true;
        };
        var timer:SimpleTimer = new SimpleTimer();
        timer.start(1, 1, callback);
        FlxG.elapsed = 1;
        timer.update();
        assertTrue("Expected callback to be called", callbackCalled);
        assertEquals("Expected callback arg to be provided", timer, callbackArg);
    }
}
}
