import 'package:flutter/material.dart';
import 'dart:collection';
import 'todo_text_title.dart';
import 'todo_appbar.dart';
import 'todo_table_calendar.dart';
import 'package:untitled2/core/widget/task.dart';

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
          gradient: LinearGradient( //🧩 градиент
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(86, 82, 81, 1), // светло-серый вверху
              Color.fromRGBO(61, 60, 58, 1.0),
              Color.fromRGBO(51, 50, 48, 1.0),// тёмно-серый внизу
            ],
          ),
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
    );
  }
}