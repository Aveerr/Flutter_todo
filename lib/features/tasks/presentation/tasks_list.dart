import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/tasks/domain/tasks_list_state.dart';
import '../../calendar/domain/calendar_state.dart';

class ToDoTaskContainer extends StatefulWidget{
  const ToDoTaskContainer({super.key});

  @override
  State<ToDoTaskContainer> createState() => _ToDoTaskContainerState();
}

class _ToDoTaskContainerState extends State<ToDoTaskContainer> {
  @override
  Widget build(BuildContext context) {
    var selectedDay = context.watch<CalendarState>().selectedDay;
    String Date = context.watch<CalendarState>().getStringDate();

    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<TaskState>(
          builder: (context, taskState, child) {

            return Column(
              children: [
                ...taskState.getTaskByDate(Date), // 👈 добавленные задачи
              ],
            );
          },
        )
    );
  }
}