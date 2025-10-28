import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/todoScreen/domain/calendar_state.dart';
import 'package:untitled2/theme/app_gradients.dart';
import '../presentation/todo_text_title.dart';
import '../presentation/todo_table_calendar.dart';
import 'todo_appbar.dart';
import 'todo_task.dart';
import 'todo_floating_action_button.dart';



class TodoScreen extends StatefulWidget{
  const TodoScreen({super.key});
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TodoTextTitle(),
                  ToDoCalendar(),
                  ToDoTaskContainer()
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: ToDoFloatingActionButton()
    );
  }
}