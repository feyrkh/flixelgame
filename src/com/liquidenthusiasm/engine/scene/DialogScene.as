/**
 * Created with IntelliJ IDEA.
 * User: khobbs
 * Date: 5/15/14
 * Time: 12:47 PM
 * To change this template use File | Settings | File Templates.
 */
package com.liquidenthusiasm.engine.scene {
import com.liquidenthusiasm.engine.scene.element.DialogSceneElement;

import org.flixel.FlxG;

import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxPoint;
import org.flixel.FlxSprite;
import org.flixel.FlxState;

public class DialogScene extends LinearScene {
    var bgLayer:FlxGroup = new FlxGroup();
    var charLayer:FlxGroup = new FlxGroup();
    var dialog:DialogSceneElement
    var positions:Object = {};
    var charPositions:Object = {};

    public function DialogScene() {
        dialog = new DialogSceneElement(this);

        add(bgLayer);
        add(charLayer);
        add(dialog);
    }

    public function bg(background:FlxObject):DialogScene {
        this.addFrames(function(scene:DialogScene) {
            scene.bgLayer.clear();
            scene.bgLayer.add(background);
        });
        return this;
    }

    public function position(posName:String, pos:ScenePosition):DialogScene {
        this.positions[posName] = pos;
        return this;
    }

    public function char(pos:*, character:FlxObject):DialogScene {
        this.addFrames(function(scene:DialogScene) {
            if(charPositions[pos]) {
                charLayer.remove(charPositions[pos]);
            }
            charLayer.add(character);
            charPositions[pos] = character;
            var p:ScenePosition = convertToScenePosition(pos);
            if(p) {
                character.x = p.coords.x;
                character.y = p.coords.y;
                character["scale"] = p.scale;
            } else {
                trace("Invalid scene position: "+pos);
            }
        });
        return this;
    }

    private function convertToScenePosition(pos:*):ScenePosition {
        if(pos is String) {
            pos = positions[pos];
        }
        return pos as ScenePosition;
    }

    private var dim = function(o) {
        var sprite = o as FlxSprite;
        if(sprite) {
            sprite.color = 0xffb0b0b0;
        }
    }

    private var bright = function(o) {
        var sprite = o as FlxSprite;
        if(sprite) {
            sprite.color = 0xffffff;
        }
    }

    public function say(pos:*, ...text):DialogScene {
        this.addFrames(function() {
            var char = charPositions[pos];
            if(pos) {
                charLayer.runAll(dim);
            } else {
                charLayer.runAll(bright);
            }
            if(char) {
                bright(char);
            }
        });
        this.addFrames(dialog.buildSceneFrames(text));
        this.addFrames(function() {charLayer.setAll("color", 0xffffffff) });
        return this;
    }

    public function exit(state:FlxState):DialogScene {
        addFrames(function() {
            FlxG.switchState(state);
        });
        return this;
    }
}
}
