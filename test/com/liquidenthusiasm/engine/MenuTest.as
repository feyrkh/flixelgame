package com.liquidenthusiasm.engine {
import asunit.framework.TestCase;

import org.flixel.FlxG;

public class MenuTest extends TestCase {
    [Test]
    public function verifyDefaultLayout():void {
        var lastPressed:String = null;
        var menu:Menu = new Menu(null, null, function(option) {
            lastPressed = option;
        });
        menu.defaultButtonHeight = 10;
        menu.defaultButtonWidth = 100;
        menu.x = 0;
        menu.y = 0;
        menu.setOptions(new Array("one", "two", "three", "four"));
        assertEquals("one.x", menu.xMargin, menu.buttons[0].x);
        assertEquals("two.x", menu.xMargin, menu.buttons[1].x);
        assertEquals("three.x", menu.xMargin, menu.buttons[2].x);
        assertEquals("four.x", menu.xMargin, menu.buttons[3].x);
        assertEquals("one.y", menu.yMargin, menu.buttons[0].y);
        assertEquals("two.y", menu.yMargin + (menu.ySpacing + 10), menu.buttons[1].y);
        assertEquals("three.y", menu.yMargin + (menu.ySpacing + 10)*2, menu.buttons[2].y);
        assertEquals("four.y", menu.yMargin + (menu.ySpacing + 10)*3, menu.buttons[3].y);
        assertEquals("Menu width", menu.xMargin*2+menu.defaultButtonWidth, menu.width);
        assertEquals("Menu height", menu.yMargin*2+menu.defaultButtonHeight*4+menu.ySpacing*3, menu.height);

        menu.centerOnScreen();
        assertEquals("Menu width", menu.xMargin*2+menu.defaultButtonWidth, menu.width);
        assertEquals("Menu height", menu.yMargin*2+menu.defaultButtonHeight*4+menu.ySpacing*3, menu.height);

        var xOfs:int = FlxG.width/2 - menu.width/2;
        var yOfs:int = FlxG.height/2 - menu.height/2;

        assertEquals("one.x", menu.xMargin+xOfs, menu.buttons[0].x);
        assertEquals("two.x", menu.xMargin+xOfs, menu.buttons[1].x);
        assertEquals("three.x", menu.xMargin+xOfs, menu.buttons[2].x);
        assertEquals("four.x", menu.xMargin+xOfs, menu.buttons[3].x);
        assertEquals("one.y", menu.yMargin+yOfs, menu.buttons[0].y);
        assertEquals("two.y", menu.yMargin+yOfs + (menu.ySpacing + 10), menu.buttons[1].y);
        assertEquals("three.y", menu.yMargin+yOfs + (menu.ySpacing + 10)*2, menu.buttons[2].y);
        assertEquals("four.y", menu.yMargin+yOfs + (menu.ySpacing + 10)*3, menu.buttons[3].y);

    }
}
}
