package com.liquidenthusiasm.engine {
import com.liquidenthusiasm.timer.EndEarlyOnInputTimer;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxTimer;

public class DemoState extends FlxState {
    private var text:FlxText;

    private static const ATTRACT_MODE_DURATION:int = 15;

    public override function create():void {
        var endDemoTimer = new EndEarlyOnInputTimer();
        endDemoTimer.start(ATTRACT_MODE_DURATION, 1, fadeOut);
        text = new FlxText(FlxG.random()*FlxG.width, FlxG.random()*FlxG.height, 100, "Demo!");
        add(text);
        var textTimer = new FlxTimer();
        textTimer.start(0.5, -1, function() {
            text.x = FlxG.random()*FlxG.width;
            text.y = FlxG.random()*FlxG.height;
        });
    }

    public override function destroy():void {
        super.destroy();
    }

    private function fadeOut():void {
        FlxG.fade(FlxG.BLACK, 1, switchToMainMenuState);
    }
    private function switchToMainMenuState() {
        FlxG.switchState(new MainMenuState());
    };
}
}
