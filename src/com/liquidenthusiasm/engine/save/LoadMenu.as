package com.liquidenthusiasm.engine.save {
import com.liquidenthusiasm.engine.*;

import flash.utils.Dictionary;

import org.flixel.FlxG;

import org.flixel.FlxGroup;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxU;
import org.flixel.plugin.photonstorm.FlxButtonPlus;

public class LoadMenu extends Menu {
    private var gamePrefix:String;
    private var _cancelCallback:Function;
    private var _selectedCallback:Function;
    private var _deletedCallback:Function;

    public function LoadMenu(gamePrefix:String, cancelCallback:Function, selectedCallback:Function) {
        this.gamePrefix = gamePrefix;
        _cancelCallback = cancelCallback;
        _selectedCallback = selectedCallback;
        super(null, false, buttonSelected);
        createLoadMenuButtons();
    }

    protected function createLoadMenuButtons():void {
        var saveSlots:Array = Flixelgame.Save.getSaveSlotNames();
        var options:Array = saveSlots.slice();
        if(saveSlots.length == 0) {
            options.push("(no saved games)");
        }
        options.push("Cancel");
        options.push("create save");
        options.push("wipe saves");
        var callbacks:Dictionary = new Dictionary();
        callbacks["(no saved games)"] = function() {};
        callbacks["Cancel"] = _cancelCallback;
        callbacks["create save"] = function() {
            var saveName = gamePrefix+int(FlxG.random()*1000);
            Flixelgame.Save.saveState(saveName, {});
        };
        callbacks["wipe saves"] = function() {
            Flixelgame.Save.wipeSaves();
        };

        this.defaultButtonWidth = 300;
        setOptions(options, callbacks);
        for(var i=0;i<saveSlots.length;i++) {
            var deleteButton:FlxButtonPlus = this.deleteButtonFactory(saveSlots[i]);
            deleteButton.x = buttons[i].width + 10;
            deleteButton.y = buttons[i].y;
            add(deleteButton);
        }
        super._width = _width + defaultButtonHeight + 5;
        adjustPosition();
    }

    public override function destroy():void {
        gamePrefix = null;
        _cancelCallback = null;
        _selectedCallback = null;
        _deletedCallback = null;
        clearButtons();
        super.destroy();
    }

    private function deleteButtonClicked(saveSlot:String):void {
        trace("Deleting save slot: "+saveSlot);
        if(Flixelgame.Save.deleteState(saveSlot)) {
            clearButtons();
            createLoadMenuButtons();
            adjustPosition();
        }
    }

    private function adjustPosition():void {
        centerOnScreen();
        this.y = 20;
    }

    private function clearButtons():void {
        for(var i=0;i<length;i++) {
            members[i].kill();
            this.remove(members[i]);
        }
        clear();
        buttons.length = 0;
        this.x = 0;
        this.y = 0;
    }

    private function deleteButtonFactory(option:String):FlxButtonPlus {
        var newButton:FlxButtonPlus = new FlxButtonPlus(0, 0, deleteButtonClicked, new Array(option), "X", defaultButtonHeight, defaultButtonHeight, defaultFontSize);
        return newButton;
    }

    private function buttonSelected(saveslot:String):void {
        _selectedCallback(saveslot);
    }
}
}
