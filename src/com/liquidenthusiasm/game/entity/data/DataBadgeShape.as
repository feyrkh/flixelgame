package com.liquidenthusiasm.game.entity.data {
import com.liquidenthusiasm.engine.Enumerable;

import flash.net.registerClassAlias;

import org.flixel.plugin.photonstorm.FlxExtendedSprite;

public class DataBadgeShape extends Enumerable
{
    registerClassAlias("com.liquidenthusiasm.game.entity.data.DataBadgeShape", DataBadgeShape);

    [Embed(source="/img/badge/circle.png")] protected static var Circle:Class;
    [Embed(source="/img/badge/triangle.png")] protected static var Triangle:Class;
    [Embed(source="/img/badge/square.png")] protected static var Square:Class;
    [Embed(source="/img/badge/pentagon.png")] protected static var Pentagon:Class;
    [Embed(source="/img/badge/hexagon.png")] protected static var Hexagon:Class;

    public static const CIRCLE:DataBadgeShape = new DataBadgeShape(0, Circle);
    public static const TRIANGLE:DataBadgeShape = new DataBadgeShape(1, Triangle, 7, 10);
    public static const SQUARE:DataBadgeShape = new DataBadgeShape(2, Square);
    public static const PENTAGON:DataBadgeShape = new DataBadgeShape(3, Pentagon, 7, 8);
    public static const HEXAGON:DataBadgeShape = new DataBadgeShape(4, Hexagon);

    private var _graphic:Class;
    private static var _allItems:Vector.<DataBadgeShape>;
    private var _xOfs:Number;
    private var _yOfs:Number;
    private var _fontSize:uint;

    {
        _allItems = Vector.<DataBadgeShape>(initEnum(DataBadgeShape, false));
    }
    public static function get allItems():Vector.<DataBadgeShape> {
        return _allItems;
    }
    public function DataBadgeShape(index:uint, shapeImgClass:Class, xOfs:Number=7, yOfs:Number=7, fontSize:uint=16)
    {
        super(index);
        this._graphic = shapeImgClass;
        _fontSize = fontSize;
        _xOfs = xOfs;
        _yOfs = yOfs;
    }

    public function get graphic():Class {
        return _graphic;
    }

    public function get xOfs():Number {
        return _xOfs;
    }

    public function get yOfs():Number {
        return _yOfs;
    }

    public function get fontSize():uint {
        return _fontSize;
    }
}
}
