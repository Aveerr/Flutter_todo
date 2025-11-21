import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/tasks/domain/tasks_list_state.dart';
import '../../../core/widget/task.dart';
import '../../calendar/domain/calendar_state.dart';

class ToDoTaskContainer extends StatefulWidget{
  const ToDoTaskContainer({super.key});

  @override
  State<ToDoTaskContainer> createState() => _ToDoTaskContainerState();
}

class _ToDoTaskContainerState extends State<ToDoTaskContainer> {
  @override
  Widget build(BuildContext context) {
    String date = context.watch<CalendarState>().getStringDate();
    List<Task> tasksEntry = context.watch<TaskState>().getTaskByDate(date);

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          ...tasksEntry, // отрисовка списка всех задач в виджете Column
        ],
      )
    );
  }
}