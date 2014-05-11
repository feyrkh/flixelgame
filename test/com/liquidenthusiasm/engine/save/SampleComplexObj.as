package com.liquidenthusiasm.engine.save {
public class SampleComplexObj {
    public var _id:String;
    public function SampleComplexObj(id:String = null) {
        _id = id;
    }

    public function say(msg:String):String {
        return _id+" says: "+msg;
    }
}
}
