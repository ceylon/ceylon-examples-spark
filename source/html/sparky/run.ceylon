import ceylon.html {
    ...
}

import spark {
    Spark {
        ...
    }
}

shared void run() {
    port(1234);

    get("/*",
        (req, res)
            => let (name = req.splat()[0]
                           else "World")
        Html {
            Head {
                title = "Hello World";
            },
            Body {
                P { "Hello ``name``!" }
            }
        });

    print("Starting server on http://localhost:1234/");
}