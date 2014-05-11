package com.liquidenthusiasm.engine.save {
import org.flixel.FlxG;
import org.flixel.FlxSave;

public class SaveGameIndex {
    private var saveSys:FlxSave = new FlxSave();
    private var saveStateName:String;
    private static const SAVE_INDEX_NAME:String = "__lqen__saveSlotIndex__";

    public function SaveGameIndex(saveStateName:String):void {
        this.saveStateName = saveStateName;
    }


    public function getSaveSlotNames():Array {
        var slots:Array = null;
        if (saveSys.bind(saveStateName)) {
            slots = saveSys.data[SAVE_INDEX_NAME];
        }
        saveSys.close();
        if (!slots) {
            slots = new Array();
        }
        return slots.slice();
    }

    public function saveState(slotName:String, slotData:*):Boolean {
        return openSaveFile(function(saveSys:FlxSave) {
            saveSys.data[slotName] = slotData;
            var slots:Array = deleteSaveSlotIndexEntry(slotName);
            slots.unshift(slotName);
            saveSys.data[SAVE_INDEX_NAME] = slots;
        });
    }


    private function deleteSaveSlotIndexEntry(slotName:String):Array {
        var slots = saveSys.data[SAVE_INDEX_NAME] || new Array();
        slots = slots.filter(function (el) {
            return el != slotName
        });
        saveSys.data[SAVE_INDEX_NAME] = slots;
        return slots;
    }

    public function wipeSaves():Boolean {
        return openSaveFile(function(saveSys:FlxSave) {
            saveSys.data = {};
            saveSys.erase();
        });
    }

    public function getSaveState(slotName:String):* {
        var data:* = null;
        openSaveFile(function(saveSys:FlxSave) {
            data = saveSys.data[slotName];
        });
        return data;
    }

    private function openSaveFile(cmd:Function):Boolean {
        var status:Boolean = false;
        if (status = saveSys.bind(saveStateName)) {
            cmd(saveSys);
        } else {
            trace("Failed to open save slot for "
                    + saveStateName);
            FlxG.log("Failed to open save slot for " + saveStateName);
        }
        return saveSys.close() && status;
    }

    public function deleteState(slotName:String):Boolean {
        return openSaveFile(function(saveSys:FlxSave) {
            delete saveSys.data[slotName];
            deleteSaveSlotIndexEntry(slotName);
        })
    }
}
}
