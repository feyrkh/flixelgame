package com.liquidenthusiasm.engine.save {
import com.liquidenthusiasm.engine.*;

import flash.utils.Dictionary;

import org.flixel.FlxG;

import org.flixel.FlxGroup;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxU;

public class LoadMenu extends Menu {
    private var gamePrefix:String;
    private var _cancelCallback:Function;
    private var _selectedCallback:Function;
    public function LoadMenu(gamePrefix:String, cancelCallback:Function, selectedCallback:Function) {
        this.gamePrefix = gamePrefix;
        _cancelCallback = cancelCallback;
        _selectedCallback = selectedCallback;
        super(null, false, buttonSelected);
        var saveSlots:Array = Flixelgame.Save.getSaveSlotNames();
        if(saveSlots.length == 0) {
            saveSlots.push("(no saved games)");
        }
        saveSlots.push("Cancel");
        saveSlots.push("create save");
        saveSlots.push("wipe saves");
        var callbacks:Dictionary = new Dictionary();
        callbacks["(no saved games)"] = function() {};
        callbacks["Cancel"] = cancelCallback;
        callbacks["create save"] = function() {
            var saveName = gamePrefix+int(FlxG.random()*1000);
            Flixelgame.Save.saveState(saveName, {});
        };
        callbacks["wipe saves"] = function() {
            Flixelgame.Save.wipeSaves();
        };

        this.defaultButtonWidth = 300;
        setOptions(saveSlots, callbacks);
    }

    private function buttonSelected(saveslot:String):void {
        _selectedCallback(saveslot);
    }
}
}
