package com.liquidenthusiasm.engine {
import com.liquidenthusiasm.timer.EndEarlyOnInputTimer;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxTimer;

public class DemoState extends FlxState {
    var endDemoTimer:FlxTimer;
    var textTimer:FlxTimer;
    var text:FlxText;

    public override function create():void {
        endDemoTimer = new EndEarlyOnInputTimer();
        endDemoTimer.start(10, 1, fadeOut);
        text = new FlxText(FlxG.random()*FlxG.width, FlxG.random()*FlxG.height, 100, "Demo!");
        add(text);
        textTimer = new FlxTimer();
        textTimer.start(0.5, -1, function() {
            text.x = FlxG.random()*FlxG.width;
            text.y = FlxG.random()*FlxG.height;
        });
    }

    public override function destroy():void {
        super.destroy();
        endDemoTimer.stop();
        textTimer.stop();
        text = null;
    }

    private function fadeOut():void {
        FlxG.fade(FlxG.BLACK, 1, function() { FlxG.switchState(new MainMenuState()); });
    }
}
}
