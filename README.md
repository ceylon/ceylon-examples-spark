# Spark web framework with Ceylon

This project contains simple examples of the use of [Spark] 
with Ceylon.

[Spark]: http://sparkjava.com/

## Compiling the examples

To compile the examples, either import this project into 
Ceylon IDE, or, in this directory, type:

    ceylon compile

## Running the examples

To run the Hello World example, in this directory, type:

    ceylon run hello.sparky

And go to <http://localhost:4567/hello>.

To run the Todo list example, in this directory, type:

    ceylon run todo.sparky

And got to <http://localhost:9999>.

## Assembling and running a fat jar

To assemble a "fat" jar, in this directory, type:

    ceylon fat-jar hello.sparky

Then, to run the jar with `java`, type:

    java -jar hello.sparky-1.0.0.jar