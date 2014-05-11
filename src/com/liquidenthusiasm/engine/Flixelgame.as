package com.liquidenthusiasm.engine {

import com.liquidenthusiasm.engine.save.SaveGameIndex;
import com.sociodox.theminer.TheMiner;
import com.sociodox.theminer.TheMinerActionEnum;

import flash.net.registerClassAlias;

import org.flixel.FlxG;

import org.flixel.FlxGame;
import com.liquidenthusiasm.engine.save.SaveGameIndex;

[SWF(width="800", height="600", backgroundColor="#666666")]
    [Frame(factoryClass="com.liquidenthusiasm.engine.Preloader")]

    public class Flixelgame extends FlxGame
    {
        public static const SAVE_STATE_PREFIX:String = "LiquidEnthusiasmGame";
        private const DEBUGGER_ENABLED:Boolean = true;

        public static const Save:SaveGameIndex = new SaveGameIndex(SAVE_STATE_PREFIX);
        private var debuggerAdded:Boolean = false;
        private static var autoAddDebugger = false;
        CONFIG::debug {
            autoAddDebugger = true;
        }
        public function Flixelgame():void
        {
            forceDebugger = false;


            // TODO: Add class aliases for your save system here - needed for retrieving objects back from the SaveGameIndex!
            //registerClassAlias("com.liquidenthusiasm.Player", Player);

            trace("About to load game");
            super(800,600,IntroLogoState,1,50,50);
            if(autoAddDebugger) {
                setupDebugger();
            }
        }

    private function setupDebugger():void {
        MemoryTracker.stage = this.stage;
        debuggerAdded = true;
        var theMiner:TheMiner = new TheMiner();
        addChild(theMiner);
        TheMiner.Do(TheMinerActionEnum.TOGGLE_INTERFACE_MEMORY_PROFILER);
    }

        protected override function update():void {
            super.update();
        }
    }
}
