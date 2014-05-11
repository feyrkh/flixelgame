package {
import flash.display.Sprite;

import asunit.textui.TestRunner;

import org.flixel.FlxGame;
import org.flixel.FlxState;

public class TestMain extends FlxGame
{
    public function TestMain()
    {
        super(800,600,FlxState,1,50,50);
        var unittests:TestRunner = new TestRunner();
        stage.addChild(unittests);
        unittests.start(AllTests, null, TestRunner.SHOW_TRACE);
    }
}
}
