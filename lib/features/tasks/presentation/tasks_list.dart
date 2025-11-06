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
    //var selectedDay = context.watch<CalendarState>().selectedDay;
    String date = context.watch<CalendarState>().getStringDate();

    List<TaskEntry> tasksEntry = context.watch<TaskState>().getTaskByDate(date);
    List<Task> tasks = tasksEntry.map((entry) => entry.task).toList();

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [ /// я хз что тут не так, мы получаем по дате суть в том что он скорее всего возвращает несколько типов и он не моджет определиться
          ...tasks, // 👈 добавленные задачи
        ],
      )
    );
  }
}