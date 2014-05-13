package com.liquidenthusiasm.game.entity.data {
import com.liquidenthusiasm.engine.Enumerable;

import org.flixel.FlxG;

import org.flixel.plugin.photonstorm.FlxColor;

public class InputBadgeColor extends Enumerable {
    public static const WHITE:InputBadgeColor = new InputBadgeColor(0, FlxG.WHITE, FlxG.BLACK);
    public static const RED:InputBadgeColor = new InputBadgeColor(1, FlxG.RED, FlxG.BLACK);
    public static const ORANGE:InputBadgeColor = new InputBadgeColor(2, 0xffffa500, FlxG.BLACK);
    public static const YELLOW:InputBadgeColor = new InputBadgeColor(3, 0xffffff00, FlxG.BLACK);
    public static const GREEN:InputBadgeColor = new InputBadgeColor(4, FlxG.GREEN, FlxG.BLACK);
    public static const BLUE:InputBadgeColor = new InputBadgeColor(5, FlxG.BLUE, FlxG.BLACK);
    public static const VIOLET:InputBadgeColor = new InputBadgeColor(6, 0xff2E0854, FlxG.WHITE);
    public static const BLACK:InputBadgeColor = new InputBadgeColor(7, FlxG.BLACK, FlxG.WHITE);

    public var color:uint;
    public var textColor:uint;
    private static var _allItems:Vector.<InputBadgeColor>;

    public function InputBadgeColor(index:uint, color:uint, textColor:uint) {
        super(index);
        this.color = color;
        this.textColor = textColor;
    }

    {
        _allItems = Vector.<InputBadgeColor>(initEnum(InputBadgeColor, false));
    }
    public static function get allItems():Vector.<InputBadgeColor> {
        return _allItems;
    }
}
}
