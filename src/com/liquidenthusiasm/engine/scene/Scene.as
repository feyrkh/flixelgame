/**
 * Created with IntelliJ IDEA.
 * User: khobbs
 * Date: 5/14/14
 * Time: 1:02 PM
 * To change this template use File | Settings | File Templates.
 */
package com.liquidenthusiasm.engine.scene {
import org.flixel.FlxBasic;

public interface Scene {
    function nextFrame(frameIdx:*=null):void;
    function endScene():void;

    function set paused(paused:Boolean):void;
}
}
