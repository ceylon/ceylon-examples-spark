import spark {
    Spark {
        ...
    }
}

shared void run() {
    get("/hello", (req, res) => "Hello World");
}
