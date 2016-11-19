import ceylon.interop.java {
    javaString,
    JavaList
}

import java.lang {
    JLong=Long,
    JString=String
}
import java.util {
    HashMap
}

//TODO: move this generally-useful function into a library!
HashMap<JString,Object> velocityContext({<String->Anything>*} model) {
    value map = HashMap<JString,Object>();
    for (key -> item in model) {
        if (exists item) {
            map.put(javaString(key),
                if (is Integer item)
                    then JLong(item)
                else if (is String item)
                    then javaString(item)
                else if (is List<Anything> item)
                    then JavaList(item)
                else item);
        }
    }
    return map;
}
