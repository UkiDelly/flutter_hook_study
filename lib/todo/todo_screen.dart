import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'state/todo_state.dart';

class TodoScreen extends HookWidget {
  const TodoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('할 일 목록'),
      ),
      body: HookConsumer(
        builder: (context, ref, child) {
          final todoList = ref.watch(todoStateProvider);

          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(todoList[index].title),
                  Checkbox(
                    value: todoList[index].isDone,
                    onChanged: (value) {
                      ref.read(todoStateProvider.notifier).toggleDone(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
