package com.liquidenthusiasm.game.entity.data {
import org.flixel.FlxGroup;
import org.flixel.FlxPoint;
import org.flixel.FlxText;
import org.flixel.plugin.photonstorm.FlxExtendedSprite;

public class InputBadge extends FlxGroup {
    private var badgeShape:InputBadgeShape;
    private var badgeColor:InputBadgeColor;
    private var badgeNumber:int;
    private var text:FlxText;
    private var sprite:FlxExtendedSprite;
    private const defaultBadgeScale:FlxPoint = new FlxPoint(1, 1);

    public function InputBadge(x:int, y:int, shape:InputBadgeShape, badgeColor:InputBadgeColor, number:int) {
        super();
        this.badgeShape = shape;
        this.badgeColor = badgeColor;
        this.badgeNumber = number;
        sprite = new FlxExtendedSprite(0, 0, shape.graphic);
        sprite.scale = defaultBadgeScale;
        if(badgeColor != InputBadgeColor.WHITE) {
            sprite.color = badgeColor.color;
        }
        sprite.setOriginToCorner();
        this.add(sprite);
        number = number % 10;
        if(number > 0) {
            text = new FlxText(badgeShape.xOfs, badgeShape.yOfs, badgeShape.fontSize, number.toString());
            text.size = badgeShape.fontSize;
            text.color = badgeColor.textColor;
            text.alignment = "center";
            text.setOriginToCorner();
            this.add(text);
        }
        this.x = x;
        this.y = y;
    }

    public function set scale(val:FlxPoint):void {
        this.sprite.scale = val;
        if(text != null) {
            text.scale = val;
            text.x = badgeShape.xOfs * val.x + sprite.x;
            text.y = badgeShape.yOfs * val.y + sprite.y;
        }
    }

    public override function destroy():void {
        super.destroy();
        this.badgeShape = null;
        this.badgeColor = null;
        this.text = null;
        this.sprite = null;
    }
}
}
