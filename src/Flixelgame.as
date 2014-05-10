package {

import flash.display.Sprite;
import flash.text.TextField;

import org.flixel.FlxGame;

    [SWF(width="800", height="600", backgroundColor="#000000")]
    [Frame(factoryClass="Preloader")]

    public class Flixelgame extends FlxGame
    {
        public function Flixelgame():void
        {
            forceDebugger = true;
            trace("About to load game");
            super(800,600,MainMenuState,1,50,50);
        }
    }
}
