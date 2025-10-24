import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/todoScreen/domain/calendar_state.dart';
import 'package:untitled2/features/todoScreen/domain/task_state.dart';

class ToDoTask extends StatefulWidget{
  const ToDoTask({super.key});

  @override
  State<ToDoTask> createState() => _ToDoTaskState();
}

class _ToDoTaskState extends State<ToDoTask> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<TaskState>(
          builder: (context, taskState, child) {
            return Column(
              children: [
                ...taskState.task, // 👈 добавленные задачи
              ],
            );
          },
        )
    );
  }

}