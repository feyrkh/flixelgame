package com.liquidenthusiasm.engine {

import com.liquidenthusiasm.engine.save.SaveGameIndex;

import flash.net.registerClassAlias;

import org.flixel.FlxG;

import org.flixel.FlxGame;
import com.liquidenthusiasm.engine.save.SaveGameIndex;

[SWF(width="800", height="600", backgroundColor="#000000")]
    [Frame(factoryClass="com.liquidenthusiasm.engine.Preloader")]

    public class Flixelgame extends FlxGame
    {
        public static const SAVE_STATE_PREFIX:String = "LiquidEnthusiasmGame";
        public static const Save:SaveGameIndex = new SaveGameIndex(SAVE_STATE_PREFIX);

        public function Flixelgame():void
        {
            forceDebugger = true;

            // Add class aliases for your save system here - needed for retrieving objects back from the SaveGameIndex!
            //registerClassAlias("com.liquidenthusiasm.Player", Player);

            trace("About to load game");
            super(800,600,IntroLogoState,1,50,50);
        }
    }
}
