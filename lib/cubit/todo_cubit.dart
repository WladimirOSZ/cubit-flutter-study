import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial(todos: []));

  void add(String title) {
    if (title.isEmpty) {
      final currentState = state as TodoInitial;
      emit(currentState.copyWith(error: 'Title is required'));
      return;
    }

    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    final currentState = state as TodoInitial;
    emit(TodoInitial(
      todos: [...currentState.todos, todo],
      error: null,
    ));
  }

  @override
  void onChange(Change<TodoState> change) {
    print('todoCubit change: $change');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('todoCubit error: $error');
    super.onError(error, stackTrace);
  }
}
