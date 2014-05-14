/**
 * Created with IntelliJ IDEA.
 * User: khobbs
 * Date: 5/14/14
 * Time: 2:27 PM
 * To change this template use File | Settings | File Templates.
 */
package com.liquidenthusiasm.engine.scene {
import com.liquidenthusiasm.timer.SimpleTimer;

import org.flixel.FlxG;

import org.flixel.FlxGroup;
import org.flixel.FlxText;

public class DialogSceneElement extends FlxGroup {
    private var curText:String;
    private var targetText:String;
    private var index:int;
    private var timer:SimpleTimer = new SimpleTimer();
    private var textField:FlxText;
    private var scene:Scene;
    private var displayFinished:Boolean;
    public var lettersPerSecond:Number = 1;
    private var curLettersPerSecond:Number;

    public function DialogSceneElement(scene:Scene) {
        this.scene = scene;
        this.textField = new FlxText(0, 0, FlxG.width, "");
    }

    public function display(text:String):void {
        this.scene.paused = true;
        this.curText = "";
        this.targetText = text;
        this.displayFinished = false;
        this.index = 0;
        timer.start(1.0 / lettersPerSecond, text.length, targetTextTick);
    }

    private function targetTextTick():void {
        index++;
        this.curText = targetText.substr(0, index);
        this.textField.text = this.curText;
        if(index >= targetText.length) {
            timer.stop();
            textFinished();
            return;
        }
    }

    private function textFinished():void {
        this.displayFinished = true;
    }

    public override function update():void {
        super.update();
        if(!FlxG.paused && (FlxG.keys.justPressed("SPACE") || FlxG.mouse.justPressed())) {
            if(this.displayFinished) {
                this.scene.paused = false;
            } else {
                this.curLettersPerSecond = this.lettersPerSecond * 10;
            }
        }
    }

    public function buildSceneFrames(...textFrames):Array {
        return textFrames.map(buildSceneFrame, this);
    }

    private function buildSceneFrame(text:String, idx, arr):Function {
        var el = this;
        return function(scene:Scene) {
            el.curLettersPerSecond = el.lettersPerSecond;
            el.display(text);
        }
    }
}
}
