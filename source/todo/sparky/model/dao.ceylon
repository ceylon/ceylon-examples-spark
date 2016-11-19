import ceylon.collection {
    ArrayList
}

shared object todoDao {

    value data = ArrayList<Todo>();

    shared List<Todo> all => data.sequence();

    shared void add(Todo todo) => data.add(todo);

    shared Todo? find(String id)
            => data.find((t) => t.id==id);

    shared void update(String id, String title) {
        if (exists todo = find(id)) {
            todo.title = title;
        }
    }

    shared List<Todo> ofStatus(String? statusString)
        => switch (statusString?.uppercased)
        case (null | "") data
        case ("ACTIVE") withStatus(Status.active)
        case ("COMPLETE") withStatus(Status.complete)
        else [];

    shared List<Todo> withStatus(Status status)
            => data
                .filter((t) => t.status==status)
                .sequence();

    shared void remove(String id) {
        if (exists todo = find(id)) {
            data.remove(todo);
        }
    }

    shared void removeCompleted()
            => withStatus(Status.complete)
                .each((t) => remove(t.id));

    shared void toggleStatus(String id)
            => find(id)?.toggleStatus();

    shared void toggleAll(Boolean complete)
            => data.each((t) => t.toggleStatus());

}
