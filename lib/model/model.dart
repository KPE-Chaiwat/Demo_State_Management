class Tasks {
  String role;
  String status;
  Tasks({required this.role, this.status = "Nomal"});
}

class Todo {
  late List<Tasks> tasks;
  Todo({List<Tasks>? inittasks}) {
    // if (tasks != null) {
    //   tasks = inittasks!;
    // } else {
    //   tasks = [];
    // }
    tasks = inittasks ?? [];
  }
}
