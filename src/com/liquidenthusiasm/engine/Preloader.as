package com.liquidenthusiasm.engine
{
	import org.flixel.system.FlxPreloader;

	public class Preloader extends FlxPreloader
	{
		public function Preloader():void
		{
			className = "com.liquidenthusiasm.engine.Flixelgame";
			super();
		}
	}
}