"Todo list example application using [Spark] and [intercooler.js].
 Based on [this example][spark-intercooler].

 [Spark]: http://sparkjava.com/
 [intercooler.js]: http://intercoolerjs.org/
 [spark-intercooler]: https://github.com/tipsy/spark-intercooler"
native ("jvm")
module todo.sparky "1.0.0" {
    import java.base "8";
    import ceylon.interop.java "1.3.1";
    import ceylon.collection "1.3.1";
    import maven:"com.sparkjava:spark-core" "2.5.2";
    import maven:"com.sparkjava:spark-template-velocity" "2.3";
}
