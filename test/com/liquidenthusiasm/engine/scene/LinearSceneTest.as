/**
 * Created with IntelliJ IDEA.
 * User: khobbs
 * Date: 5/14/14
 * Time: 1:19 PM
 * To change this template use File | Settings | File Templates.
 */
package com.liquidenthusiasm.engine.scene {
import asunit.framework.TestCase;

import org.flixel.FlxGroup;
import org.flixel.FlxPoint;
import org.flixel.FlxSprite;

import spark.primitives.Line;

public class LinearSceneTest extends TestCase {
    var scene:LinearScene;
    var sceneData:Array.<SceneFrame> = [
        {}
    ];

    protected override function setUp():void {
        scene = new LinearScene();
        var bg:FlxSprite = new FlxSprite();
        var c1:FlxSprite = new FlxSprite(100, 500);
        var c2:FlxSprite = new FlxSprite(500, 500);
        var text:DialogSceneElement = new DialogSceneElement(scene);
        c2.scale = new FlxPoint(-1, 1);
        scene.addFrames(
            function(scene:LinearScene) { scene.add(bg); scene.add(c1); scene.add(c2); },
            function(scene:LinearScene) { scene.add(text);  }
        );
        scene.addFrames(text.buildSceneFrames("Line 1", "Another line", "Final text line"));
    }

    protected override function tearDown():void {
    }

    [Test]
    public function canGoLinearlyThroughScene() {

    }

    [Test]
    public function canSkipThroughScene() {

    }

    [Test]
    public function canEndSceneEarly() {

    }
}
}
