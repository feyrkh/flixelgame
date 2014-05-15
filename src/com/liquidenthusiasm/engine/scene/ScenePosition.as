/**
 * Created with IntelliJ IDEA.
 * User: khobbs
 * Date: 5/15/14
 * Time: 1:31 PM
 * To change this template use File | Settings | File Templates.
 */
package com.liquidenthusiasm.engine.scene {
import org.flixel.FlxPoint;

public class ScenePosition {
    public var scale:FlxPoint;
    public var coords:FlxPoint;
    public function ScenePosition(x:Number, y:Number, xScale:Number, yScale:Number) {
        this.coords = new FlxPoint(x,y);
        this.scale = new FlxPoint(xScale, yScale);
    }
}
}
