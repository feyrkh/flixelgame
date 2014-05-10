package
{
	import flash.geom.Rectangle;
	import flash.net.SharedObject;
	import org.flixel.plugin.photonstorm.FlxDisplay;

	import org.flixel.*;
	import org.flixel.plugin.DebugPathDisplay;

	public class MainMenuState extends FlxState
	{
		var mainMenuButtons:FlxGroup;
		var saveGameButtons:FlxGroup;
		
		public override function create():void {
			trace("Loading menu state");
			var newGameButton:FlxButton = new FlxButton(FlxG.width/2, 0, "New Game", startNewGame);
			var loadGameButton:FlxButton = new FlxButton(FlxG.width / 2, 0, "Load Game", showSaveGames);
			mainMenuButtons = new FlxGroup();
			mainMenuButtons.add(newGameButton);
			mainMenuButtons.add(loadGameButton);
			newGameButton.y = FlxG.height / 2 - newGameButton.height / 2 - 5;
			loadGameButton.y = FlxG.height / 2 + loadGameButton.height / 2 + 5;
			add(mainMenuButtons);
			
			saveGameButtons = new FlxGroup();
			FlxG.mouse.show();
		}
		
		private function startNewGame():void {
			trace("New game button selected");
		}
		
		private function showSaveGames():void {
			trace("Load game button selected");
			mainMenuButtons.exists = false;
			saveGameButtons.exists = true;
		}
		
		private function cancelLoadGame():void {
			trace("Back to main menu");
			mainMenuButtons.exists = true;
			saveGameButtons.exists = false;
		}
	}
}