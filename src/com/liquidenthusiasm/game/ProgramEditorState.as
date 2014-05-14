package com.liquidenthusiasm.game {
import com.liquidenthusiasm.game.entity.data.DataBadge;
import com.liquidenthusiasm.game.entity.data.DataBadgeColor;
import com.liquidenthusiasm.game.entity.data.DataBadgeShape;

import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxPoint;

import org.flixel.FlxState;

public class ProgramEditorState extends FlxState {
    private var badgeGroup:FlxGroup = new FlxGroup();
    public override function create():void {
        FlxG.bgColor = 0xff505050;
        var y:Number = 50;
        var i:int = 0;
        for each(var shape in DataBadgeShape.allItems) {
            var x:Number = 50;
            for each(var color in DataBadgeColor.allItems) {
                var inputBadge:DataBadge = new DataBadge(x, y, shape, color, i++);
                badgeGroup.add(inputBadge);
                x += 50;
            }
            y += 50;
        }
        add(badgeGroup);
    }

    public override function destroy():void {
        super.destroy();
        this.badgeGroup = null;
    }

    private var totalElapsed:Number = 0;
    private var scale = new FlxPoint(1,1);
    public override function update():void {
        totalElapsed += FlxG.elapsed;
        badgeGroup.x = Math.sin(totalElapsed/2)*60;
        var curScaleStep = int(totalElapsed/3) % 6;
        scale.x = scale.y = curScaleStep * 0.25 + 0.25;
        badgeGroup.runAll(applyScale, false);
    }

    private function applyScale(badge:DataBadge):void {
        badge.scale = scale;
    }
}
}
