import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            return Column(
              children: [
                if (state.error != null)
                  Column(
                    children: [
                      Text(state.error!),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/add-todo');
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];

                      return ListTile(
                        title: Text(todo.name),
                        subtitle: Text(todo.createdAt.toString()),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Text('Awaiting Todos');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
