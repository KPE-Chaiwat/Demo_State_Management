import 'package:bloc/bloc.dart';

import 'package:state_management_demo/model/model.dart';

class TodoCubit extends Cubit<Todo> {
  TodoCubit(Todo initState) : super(Todo());

  void add(Tasks t) {
    state.tasks.add(t);
    emit(Todo.form(state));
  }

  void remove(Tasks t) {
    state.tasks.remove(t);
    emit(Todo.form(state));
  }
}
