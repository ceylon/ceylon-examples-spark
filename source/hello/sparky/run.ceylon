import spark {
    Spark {
        ...
    }
}

shared void run() {
    get("/hello", (req, res) => "Hello World");
    print("Starting server on http://localhost:4567/hello");
}
