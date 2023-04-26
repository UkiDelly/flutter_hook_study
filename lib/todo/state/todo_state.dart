import 'package:flutter_hook/models/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_state.g.dart';

@Riverpod(keepAlive: true)
class TodoState extends _$TodoState {
  @override
  List<Todo> build() {
    return [
      Todo(title: '테스트', isDone: false)
    ];
  }

  void addTodo(String title) {
    var newTodo = Todo(
      title: title,
      isDone: false,
    );

    state = [...state, newTodo];
  }

  void toggleDone(int index) {
    var todo = state[index];
    var newTodo = todo.copyWith(isDone: !todo.isDone);

    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index) newTodo else state[i]
    ];
  }

  void remove(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }
}
