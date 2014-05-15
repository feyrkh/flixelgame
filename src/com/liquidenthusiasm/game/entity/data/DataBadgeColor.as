package com.liquidenthusiasm.game.entity.data {
import com.liquidenthusiasm.engine.Enumerable;

import flash.net.registerClassAlias;

import org.flixel.FlxG;

import org.flixel.plugin.photonstorm.FlxColor;

public class DataBadgeColor extends Enumerable {
    registerClassAlias("com.liquidenthusiasm.game.entity.data.DataBadgeColor", DataBadgeColor);
    public static const WHITE:DataBadgeColor = new DataBadgeColor(0, FlxG.WHITE, FlxG.BLACK);
    public static const RED:DataBadgeColor = new DataBadgeColor(1, FlxG.RED, FlxG.BLACK);
    public static const ORANGE:DataBadgeColor = new DataBadgeColor(2, 0xffffa500, FlxG.BLACK);
    public static const YELLOW:DataBadgeColor = new DataBadgeColor(3, 0xffffff00, FlxG.BLACK);
    public static const GREEN:DataBadgeColor = new DataBadgeColor(4, FlxG.GREEN, FlxG.BLACK);
    public static const BLUE:DataBadgeColor = new DataBadgeColor(5, FlxG.BLUE, FlxG.BLACK);
    public static const VIOLET:DataBadgeColor = new DataBadgeColor(6, 0xff2E0854, FlxG.WHITE);
    public static const BLACK:DataBadgeColor = new DataBadgeColor(7, FlxG.BLACK, FlxG.WHITE);

    public var color:uint;
    public var textColor:uint;
    private static var _allItems:Vector.<DataBadgeColor>;

    public function DataBadgeColor(index:uint, color:uint, textColor:uint) {
        super(index);
        this.color = color;
        this.textColor = textColor;
    }

    {
        _allItems = Vector.<DataBadgeColor>(initEnum(DataBadgeColor, false));
    }
    public static function get allItems():Vector.<DataBadgeColor> {
        return _allItems;
    }
}
}
