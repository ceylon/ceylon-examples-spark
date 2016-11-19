import spark {
    Spark {
        ...
    },
    Request,
    ModelAndView
}
import spark.template.velocity {
    VelocityTemplateEngine
}

import todo.sparky.model {
    Todo,
    todoDao,
    Status
}

shared void run() {

    exception(`Exception`,
        (e, req, res) => e.printStackTrace());

    staticFiles.location("/web");
    port(9999);

    get("/", (req, res) => renderTodos(req));

    post("/todos",
        (req, res) {
            todoDao.add(Todo(req.queryParams("todo-title")));
            return renderTodos(req);
        });

    delete ("/todos/completed",
        (req, res) {
            todoDao.removeCompleted();
            return renderTodos(req);
        });

    put("/todos/toggle_status",
        (req, res) {
            todoDao.toggleAll(req.queryParams("toggle-all") exists);
            return renderTodos(req);
        });

    delete("/todos/:id",
        (req, res) {
            todoDao.remove(req.params("id"));
            return renderTodos(req);
        });

    put("/todos/:id",
        (req, res) {
            todoDao.update(req.params("id"),
                req.queryParams("todo-title"));
            return renderTodos(req);
        });

    put("/todos/:id/toggle_status",
        (req, res) {
            todoDao.toggleStatus(req.params("id"));
            return renderTodos(req);
        });

    get("/todos/:id/edit",
        (req, res) => renderEditTodo(req));

    print("Starting server on http://localhost:9999/");

}

String renderEditTodo(Request req)
        => renderTemplate("velocity/editTodo.vm",
            "todo" -> todoDao.find(req.params("id")));

String renderTodos(Request req) {
    value statusStr = req.queryParams("status");
    value template =
            if (exists param = req.queryParams("ic-request"),
                param=="true")
            then "velocity/todoList.vm"
            else "velocity/index.vm";
    return renderTemplate(template,
        "todos"
            -> todoDao.ofStatus(statusStr),
        "filter"
            -> (statusStr else ""),
        "activeCount"
            -> todoDao.withStatus(Status.active).size,
        "anyCompleteTodos"
            -> (!todoDao.withStatus(Status.complete).empty),
        "allComplete"
            -> (todoDao.all.size == todoDao.withStatus(Status.complete).size),
        "status"
            -> (statusStr else ""));
}

String renderTemplate(String template, <String->Anything>* model)
        => VelocityTemplateEngine()
            .render(ModelAndView(velocityContext(model),
                                 template));
