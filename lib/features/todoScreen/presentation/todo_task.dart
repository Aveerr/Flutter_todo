import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/todoScreen/domain/task_state.dart';

class ToDoTaskContainer extends StatefulWidget{
  const ToDoTaskContainer({super.key});

  @override
  State<ToDoTaskContainer> createState() => _ToDoTaskContainerState();
}

class _ToDoTaskContainerState extends State<ToDoTaskContainer> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<TaskState>(
          builder: (context, taskState, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...taskState.task, // 👈 добавленные задачи
                ],
              ),
            );
          },
        )
    );
  }

}