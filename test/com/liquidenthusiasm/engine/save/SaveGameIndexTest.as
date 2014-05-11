package com.liquidenthusiasm.engine.save {
import asunit.framework.TestCase;

import flash.net.registerClassAlias;

public class SaveGameIndexTest extends TestCase {
    private var save:SaveGameIndex = new SaveGameIndex("SaveGameIndexTest");
    public function wipeSaveData() {
        save.wipeSaves();
    }

    protected override function setUp():void {
        wipeSaveData();
    }

    protected override function tearDown():void {
        wipeSaveData();
    }

    [Test]
    public function canSaveAndRetrieveMultipleStates() {
        assertEquals("Expected 0 save states at start", 0, save.getSaveSlotNames().length);
        save.saveState("Game1", {"id":1,"name":"Game 1"});
        save.saveState("Game2", {"id":2,"name":"Game 2","player":{"name":"Kevin"}});
        assertEquals("Expected 2 save slots to have been registered", 2, save.getSaveSlotNames().length);
        assertTrue("Expected Game1 save slot", save.getSaveSlotNames().indexOf("Game1") >= 0);
        assertTrue("Expected Game2 save slot", save.getSaveSlotNames().indexOf("Game2") >= 0);
        assertFalse("Expected Game3 save slot to not exist", save.getSaveSlotNames().indexOf("Game3") >= 0);
        assertTrue("Expected most recent save to be first in the list", save.getSaveSlotNames().indexOf("Game2") == 0);

        var data = save.getSaveState("Game1");
        assertNotNull("Expected Game1 slot to have data", data);
        assertEquals("Game1.id", 1, data.id);
        assertEquals("Game1.name", "Game 1", data.name);
        assertEquals("Game1.player", null, data.player);

        data = save.getSaveState("Game2");
        assertNotNull("Expected Game2 slot to have data", data);
        assertEquals("Game2.id", 2, data.id);
        assertEquals("Game2.name", "Game 2", data.name);
        assertEquals("Game2.player", "Kevin", data.player.name);

        data = save.getSaveState("Game3");
        assertNull("Expected Game3 slot to not have data", data);
    }

    [Test]
    public function canSaveComplexObjects() {
        registerClassAlias("com.liquidenthusiasm.engine.save.SampleComplexObj", SampleComplexObj);
        save.saveState("complexObj", new SampleComplexObj("Kevin"));
        var obj = SampleComplexObj(save.getSaveState("complexObj"));
        assertEquals("Kevin says: Hi!", obj.say("Hi!"));
    }

    [Test]
    public function canDeleteIndividualSaves() {
        registerClassAlias("com.liquidenthusiasm.engine.save.SampleComplexObj", SampleComplexObj);
        save.saveState("kevin", new SampleComplexObj("Kevin"));
        save.saveState("stephanie", new SampleComplexObj("Stephanie"));
        var kevin = SampleComplexObj(save.getSaveState("kevin"));
        var stephanie = SampleComplexObj(save.getSaveState("stephanie"));
        assertEquals("Kevin says: Hi!", kevin.say("Hi!"));
        assertEquals("Stephanie says: Hi!", stephanie.say("Hi!"));

        // Delete Kevin
        assertEquals("Failed to delete 'kevin' state", true, save.deleteState("kevin"));
        kevin = SampleComplexObj(save.getSaveState("kevin"));
        assertNull("Kevin should have been null", kevin);

        // Make sure the slot index entry is also gone
        assertFalse("Kevin's index entry should have been deleted", save.getSaveSlotNames().indexOf("kevin") >= 0);
    }

    [Test]
    public function canOverwriteSaveSlots() {
        assertEquals("Expected 0 save states at start", 0, save.getSaveSlotNames().length);
        save.saveState("Game1", {"id":1,"name":"Game 1"});
        save.saveState("Game2", {"id":2,"name":"Game 2","player":{"name":"Kevin"}});
        assertEquals("Expected 2 save slots to have been registered", 2, save.getSaveSlotNames().length);
        assertTrue("Expected Game1 save slot", save.getSaveSlotNames().indexOf("Game1") >= 0);
        assertTrue("Expected Game2 save slot", save.getSaveSlotNames().indexOf("Game2") >= 0);
        assertFalse("Expected Game3 save slot to not exist", save.getSaveSlotNames().indexOf("Game3") >= 0);
        assertTrue("Expected most recent save to be first in the list", save.getSaveSlotNames().indexOf("Game2") == 0);

        // Overwrite Game1 so that it moves back to the top of the list and is updated with new data
        save.saveState("Game1", {"id":1,"name":"Game 1b","player":{"name":"Stephanie"}});
        assertTrue("Expected Game1 save slot", save.getSaveSlotNames().indexOf("Game1") >= 0);
        assertTrue("Expected Game2 save slot", save.getSaveSlotNames().indexOf("Game2") >= 0);
        assertFalse("Expected Game3 save slot to not exist", save.getSaveSlotNames().indexOf("Game3") >= 0);
        assertTrue("Expected most recent save to be first in the list", save.getSaveSlotNames().indexOf("Game1") == 0);

        var data = save.getSaveState("Game1");
        assertNotNull("Expected Game1 slot to have data", data);
        assertEquals("Game1.id", 1, data.id);
        assertEquals("Game1.name", "Game 1b", data.name);
        assertEquals("Game1.player", "Stephanie", data.player.name);

        data = save.getSaveState("Game2");
        assertNotNull("Expected Game2 slot to have data", data);
        assertEquals("Game2.id", 2, data.id);
        assertEquals("Game2.name", "Game 2", data.name);
        assertEquals("Game2.player", "Kevin", data.player.name);    }
}

}
