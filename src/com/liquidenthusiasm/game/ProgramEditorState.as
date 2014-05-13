package com.liquidenthusiasm.game {
import com.liquidenthusiasm.game.entity.data.InputBadge;
import com.liquidenthusiasm.game.entity.data.InputBadgeColor;
import com.liquidenthusiasm.game.entity.data.InputBadgeShape;

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
        for each(var shape in InputBadgeShape.allItems) {
            var x:Number = 50;
            for each(var color in InputBadgeColor.allItems) {
                var inputBadge:InputBadge = new InputBadge(x, y, shape, color, i++);
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

    private function applyScale(badge:InputBadge):void {
        badge.scale = scale;
    }
}
}
