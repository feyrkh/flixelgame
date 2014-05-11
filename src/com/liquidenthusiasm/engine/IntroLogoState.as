package com.liquidenthusiasm.engine {
import flashx.textLayout.formats.Float;

import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxText;

public class IntroLogoState extends FlxState {
    private static const duration:int = 0.1;

    public override function create():void {
        FlxG.flash(FlxG.BLACK, duration, fadeOut);
        add(new FlxText(FlxG.width/2, FlxG.height/2, FlxG.width * 0.8, "Liquid Enthusiasm"));
    }

    private function fadeOut():void {
        FlxG.fade(FlxG.BLACK, duration, function():void { FlxG.switchState(new MainMenuState()) });
    }
}
}
