"Hello world example application for [Spark]
 that uses [[module ceylon.html]] to render
 the view.

 [Spark]: http://sparkjava.com/"
native ("jvm")
module html.sparky "1.0.0" {
    import maven:"com.sparkjava:spark-core" "2.5.2";
    import ceylon.html "1.3.0";
}
