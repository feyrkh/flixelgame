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
    private var arrangeHorizontal:Boolean;
    private var _height:int;
    private var _width:int;
    private var buttons:Array;
    private var defaultCallback:Function;

    public function Menu(buttonFactory:Function = null, arrangeHorizontal:Boolean = false, defaultCallback:Function = null) {
        this.buttonFactory = buttonFactory;
        this.defaultCallback = defaultCallback;
        this.arrangeHorizontal = arrangeHorizontal;
        if(!this.buttonFactory) {
            this.buttonFactory = defaultButtonFactory;
        }
    }

    public function setOptions(options:Array, callbacks:Dictionary = null) {
        var x = xMargin;
        var y = yMargin;
        var widest = 0;
        var tallest = 0;
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
                if(tallest < button.height) tallest = button.height;
            } else {
                 y = y + button.height + ySpacing;
                if(widest < button.width) widest = button.width;
            }
        }
        this._width = x + xMargin;
        this._height = y + yMargin;
        for each(var button in buttons) {
            if(arrangeHorizontal) {
                button.y = yMargin + (tallest - button.height) / 2;
            } else {
                button.x = xMargin + (widest - button.width) / 2;
            }
        }
    }

    private function defaultButtonFactory(option:String, data:*):FlxButton {
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
        var newButton:FlxButton = new FlxButton(0, 0, option, appliedCallback);
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
