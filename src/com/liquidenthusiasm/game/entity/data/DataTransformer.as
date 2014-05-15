package com.liquidenthusiasm.game.entity.data {
import flash.net.registerClassAlias;

import org.flixel.FlxGroup;

public class DataTransformer extends FlxGroup {
    registerClassAlias("com.liquidenthusiasm.game.entity.data.DataTransformer", DataTransformer);

    private var _input:DataBadge;
    private var _output:DataBadge;
    private var _time:int;

    public function DataTransformer(input:DataBadge, output:DataBadge, time:int) {
        _input = input;
        _output = output;
        _time = time;
        add(_input);
        add(_output);
    }


}
}
