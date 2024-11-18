part of 'todo_cubit.dart';

sealed class TodoState {}

final class TodoLoaded extends TodoState {
  final List<Todo> todos;
  final String? error;

  TodoLoaded({required this.todos, this.error});

  TodoLoaded copyWith({List<Todo>? todos, String? error}) {
    return TodoLoaded(
      todos: todos ?? this.todos,
      error: error,
    );
  }
}
