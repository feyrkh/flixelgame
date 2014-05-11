package com.liquidenthusiasm.engine
{
import com.liquidenthusiasm.engine.save.LoadMenu;
import com.liquidenthusiasm.engine.save.SaveGameIndex;
import com.liquidenthusiasm.timer.ResetOnInputTimer;
import com.liquidenthusiasm.timer.SimpleTimer;

import flash.geom.Rectangle;
	import flash.net.SharedObject;
import flash.utils.Dictionary;

import org.flixel.plugin.photonstorm.FlxDisplay;

	import org.flixel.*;
	import org.flixel.plugin.DebugPathDisplay;

	public class MainMenuState extends FlxState
	{
		private var mainMenuButtons:Menu;
        private var saveGameButtons:Menu;
        private var demoTimer:FlxTimer;
        private var menuChangeTimer:SimpleTimer;
        private const MENU_OFFSET:int = 10000;
		
		public override function create():void {
            FlxG.flash(FlxG.BLACK, 2);
            menuChangeTimer = new SimpleTimer();
			trace("Loading menu state");

            var callbacks:Dictionary = new Dictionary();
            callbacks["New Game"] = startNewGame;
            callbacks["Load"] = showSaveGames;
            mainMenuButtons = new Menu();
            mainMenuButtons.setOptions(new Array("New Game", "Load"), callbacks);
            add(mainMenuButtons);
            mainMenuButtons.centerOnScreen();
			
			saveGameButtons = new LoadMenu(Flixelgame.SAVE_STATE_PREFIX,
                cancelLoadGame,
                loadGame);
            saveGameButtons.centerOnScreen();
            saveGameButtons.y -= MENU_OFFSET;
            add(saveGameButtons);

			FlxG.mouse.show();
            demoTimer = new ResetOnInputTimer();
            demoTimer.start(15, -1, fadeToDemo);
		}

        private function loadGame(saveslot:String):void {
            trace("Loading "+saveslot);
        }

        public override function destroy():void {
            super.destroy();
            demoTimer.stop();
            mainMenuButtons = null;
            saveGameButtons = null;
        }

        public override function update():void {
            super.update();
        }

        private function fadeToDemo():void {
            FlxG.flash(FlxG.BLACK, 1, function() {FlxG.switchState(new DemoState());});
        }
		
		private function startNewGame():void {
			trace("New game button selected");
		}
		
		private function showSaveGames():void {
			trace("Load game button selected");
            mainMenuButtons.y -= MENU_OFFSET;
            saveGameButtons.y += MENU_OFFSET;
		}
		
		private function cancelLoadGame():void {
			trace("Back to main menu");
            saveGameButtons.y -= MENU_OFFSET;
            mainMenuButtons.y += MENU_OFFSET;
		}
	}
}