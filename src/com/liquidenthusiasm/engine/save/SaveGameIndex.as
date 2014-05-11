package com.liquidenthusiasm.engine.save {
import com.liquidenthusiasm.engine.Flixelgame;

import org.flixel.FlxG;

import org.flixel.FlxSave;

public class SaveGameIndex {
    private static var saveSys = new FlxSave();

    public static function getSaveSlotNames():Array {
        var slots:Array = null;
        if (saveSys.bind(Flixelgame.SAVE_STATE_PREFIX)) {
            slots = saveSys.data["saveIndex"];
        }
        saveSys.close();
        if (!slots) {
            slots = new Array();
        }
        return slots.slice();
    }

    public static function saveGame(saveName:String, saveData):void {
        openSaveFile(function(saveSys:FlxSave) {
            saveSys.data[saveName] = saveData;
            var slots = saveSys.data["saveIndex"] || new Array();
            slots.filter(function(el) { return el != saveName });
            slots.unshift(saveName);
            saveSys.data["saveIndex"] = slots;
        });
    }

    public static function wipeSaves():void {
        openSaveFile(function(saveSys:FlxSave) {
            saveSys.data = {};
            saveSys.erase();
        });
    }

    private static function openSaveFile(cmd:Function):void {
        var saveName = Flixelgame.SAVE_STATE_PREFIX;
        if (saveSys.bind(saveName)) {
            cmd(saveSys);
        } else {
            trace("Failed to open save slot for " + saveName);
            FlxG.log("Failed to open save slot for " + saveName);
        }
        saveSys.close();
    }

}
}
