package com.liquidenthusiasm.engine {
import flash.utils.Dictionary;

import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.plugin.photonstorm.FlxButtonPlus;

public class Menu extends FlxGroup {
    private var options:Array;
    private var buttonFactory:Function;

    public var ySpacing = 5;
    public var xSpacing = 5;
    public var xMargin = 5;
    public var yMargin = 5;
    public var defaultButtonWidth = 100;
    public var defaultButtonHeight = 20;
    public var defaultFontSize = 8;

    private var arrangeHorizontal:Boolean;
    private var _height:int;
    private var _width:int;
    public var buttons:Array;
    private var defaultCallback:Function;

    public function Menu(buttonFactory:Function = null, arrangeHorizontal:Boolean = false, defaultCallback:Function = null) {
        this.buttonFactory = buttonFactory;
        this.defaultCallback = defaultCallback;
        this.arrangeHorizontal = arrangeHorizontal;
        if(!this.buttonFactory) {
            this.buttonFactory = defaultButtonFactory;
        }
    }

    public override function destroy():void {
        super.destroy();
        buttons = null;
        defaultCallback = null;
        buttonFactory = null;
        options = null;
    }

    public function setOptions(options:Array, callbacks:Dictionary = null) {
        var x = xMargin;
        var y = yMargin;
        var widest = 0;
        var tallest = 0;
        if(this.buttons) {
            this.buttons.length = 0;
        }
        CONFIG::debug {
            MemoryTracker.track(this, options[0]);
        }
        this.buttons = new Array();
        for each(var option:String in options) {
            var callback = null;
            if(callbacks) callback = callbacks[option];
            var button = buttonFactory(option, callback);

            add(button);
            if(!button.onUp) {
                button.onUp = defaultCallback;
            }
            buttons.push(button);

            button.x = x;
            button.y = y;
            if(arrangeHorizontal) {
                x = x + button.width + xSpacing;
                if(tallest < button.height) {
                    tallest = button.height;
                    this._height = yMargin*2 + tallest;
                }
                this._width = xMargin + button.x + button.width;
            } else {
                y = y + button.height + ySpacing;
                if(widest < button.width) {
                    widest = button.width;
                    this._width = xMargin*2 + widest;
                }
                this._height = yMargin + button.y + button.height;
            }
        }
        for each(var button in buttons) {
            if(arrangeHorizontal) {
                button.y = yMargin + (tallest - button.height) / 2;
            } else {
                button.x = xMargin + (widest - button.width) / 2;
            }
        }
    }

    private function defaultButtonFactory(option:String, data:*):FlxButtonPlus {
        var callback:Function = defaultCallback;
        var appliedCallback;
        if(data && data instanceof Function) {
            callback = data;
        }
        if(!callback) {
            FlxG.log("ERROR: Created button with no callback: "+option);
        }
        if(callback.length != 0) {
            appliedCallback = function() { callback(option) };
        } else {
            appliedCallback = callback;
        }
        var newButton:FlxButtonPlus = new FlxButtonPlus(0, 0, appliedCallback, null, option, defaultButtonWidth, defaultButtonHeight, defaultFontSize);
        return newButton;
    }

    public function centerOn(x:int, y:int):void {
        this.x = x - this.width/2;
        this.y = y - this.height/2;
    }

    public function centerOnScreen():void {
        centerOn(FlxG.width/2, FlxG.height/2);
    }

    public function get width():int {
        return _width;
    }

    public function get height():int {
        return _height;
    }
}
}
