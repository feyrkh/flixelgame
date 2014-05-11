package {
import asunit.framework.TestCase;

import com.liquidenthusiasm.engine.MenuTest;

import com.liquidenthusiasm.engine.save.SaveGameIndexTest;

import com.liquidenthusiasm.timer.EndEarlyOnInputTimerTest;

import com.liquidenthusiasm.timer.ResetOnInputTimerTest;

import org.as3commons.reflect.Method;
import org.as3commons.reflect.Type;

import asunit.framework.TestSuite;
import com.liquidenthusiasm.timer.SimpleTimerTest;

public class AllTests extends TestSuite
{
    public function AllTests()
    {
        super();
        // com.liquidenthusiasm.engine
        addAllMethodsOf(MenuTest);

        // com.liquidenthusiasm.engine.save
        addAllMethodsOf(SaveGameIndexTest);

        // com.liquidenthusiasm.timer
        addAllMethodsOf(SimpleTimerTest);
        addAllMethodsOf(ResetOnInputTimerTest);
        addAllMethodsOf(EndEarlyOnInputTimerTest);
    }


    public function addAllMethodsOf(cls:Class):void {
        var type:Type = Type.forInstance(cls);
        testMethods = new Array();
        for each(var method:Method in type.methods) {
            if(method.hasMetadata("Test") || method.name.match("^test") || method.name.match("^Test")) {
                var test:TestCase = new cls() as TestCase;
                test.testMethods = new Array(method.name);
                addTest(test);
            }
        }
    }
}
}