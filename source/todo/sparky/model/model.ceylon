import java.util {
    UUID
}

shared class Status
        of active|complete {
    shared actual String string;
    shared new active {
        string = "ACTIVE";
    }
    shared new complete {
        string = "COMPLETE";
    }
}

shared class Todo(title,
                  id = UUID.randomUUID().string,
                  status = Status.active) {

    shared String id;
    shared variable String title;
    shared variable Status status;

    shared void toggleStatus()
            => this.status
                = complete
                    then Status.active
                    else Status.complete;

    shared Boolean complete
            => this.status == Status.complete;

}
