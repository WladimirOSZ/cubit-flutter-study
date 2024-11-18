part of 'todo_cubit.dart';

sealed class TodoState {}

final class TodoInitial extends TodoState {
  final List<Todo> todos;
  final String? error;

  TodoInitial({required this.todos, this.error});

  TodoInitial copyWith({List<Todo>? todos, String? error}) {
    return TodoInitial(
      todos: todos ?? this.todos,
      error: error,
    );
  }
}
