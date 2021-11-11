class Tasks {
  String role;
  String status;
  Tasks({required this.role, this.status = "Nomal"});
}

class Todo {
  late List<Tasks> tasks;
  Todo({List<Tasks>? inittasks}) {
    tasks = inittasks ?? [];
  }

  Todo.form(Todo old) {
    this.tasks = old.tasks;
  }
}
