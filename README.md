# Spark web framework with Ceylon

This project contains simple examples of the use of [Spark] 
with Ceylon.

[Spark]: http://sparkjava.com/

## Requirements

This project requires JDK 8 and [Ceylon] 1.3.1 or Ceylon IDE 
1.3.1 for IntelliJ or Eclipse. On the command line you can use
the provided `ceylonb` command if you don't have Ceylon already
installed.

[Ceylon]: https://ceylon-lang.org/download

## Compiling the examples

To compile the examples, either import this project into 
Ceylon IDE, or, in this directory, type:

    ./ceylonb compile

## Running the examples

To run the Hello World example, in this directory, type:

    ./ceylonb run hello.sparky

And go to <http://localhost:4567/hello>.

To run the HTML example, in this directory, type:

    ./ceylonb run html.sparky

And go to <http://localhost:1234/>.

To run the Todo list example, in this directory, type:

    ./ceylonb run todo.sparky

And got to <http://localhost:9999>.

## Assembling and running a fat jar

To assemble a "fat" jar, in this directory, type:

    ./ceylonb fat-jar hello.sparky

Then, to run the jar with `java`, type:

    java -jar hello.sparky-1.0.0.jar

## Gotcha: static files support in Spark

Spark's support for serving static files from the classpath
does not work if the server is executed with module 
isolation. Therefore, it's necessary to run with the 
`--flat-classpath` option enabled. This option is set by 
default in the file `.ceylon/config`.

