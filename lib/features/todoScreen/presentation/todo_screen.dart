import 'package:flutter/material.dart';
import 'package:untitled2/features/todoScreen/domain/calendar_state.dart';
import 'package:untitled2/theme/app_colors.dart';
import '../presentation/todo_text_title.dart';
import 'todo_appbar.dart';
import '../presentation/todo_table_calendar.dart';
import 'package:untitled2/core/widget/task.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/theme/app_gradients.dart';

class TodoScreen extends StatefulWidget{
  const TodoScreen({super.key});
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalendarState(),
      child: Scaffold(
        extendBodyBehindAppBar: true,

        appBar: TodoAppBar(),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradients.backgroundGradient,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Column(
              children: <Widget>[
                TodoTextTitle(),
                ToDoCalendar(),
                ToDoTask()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Кнопка нажата');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor:AppColors.secondary,
          child: Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}