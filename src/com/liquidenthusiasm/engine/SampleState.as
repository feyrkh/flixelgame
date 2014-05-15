/**
 * Created with IntelliJ IDEA.
 * User: khobbs
 * Date: 5/15/14
 * Time: 2:55 PM
 * To change this template use File | Settings | File Templates.
 */
package com.liquidenthusiasm.engine {
import com.liquidenthusiasm.engine.scene.DialogScene;
import com.liquidenthusiasm.engine.scene.ScenePosition;

import org.flixel.FlxSprite;

import org.flixel.FlxState;

public class SampleState extends FlxState {
    public override function create():void {
        var scene = new DialogScene();
        scene
                .position("p1", new ScenePosition(100, 400, 5, 5))
                .position("p2", new ScenePosition(500, 400, -5, 5))
                .bg(new FlxSprite())
                .char("p1", new FlxSprite())
                .char("p2", new FlxSprite())
                .say("p1", "I'm the guy on the left.")
                .say("p2", "I'm the guy on the right.")
                .say("p3", "I'm off camera.")
                .say(null, "And I'm nonexistent! And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. And have a lot to say. ")
                .exit(new MainMenuState());
        add(scene);
    }
}
}
