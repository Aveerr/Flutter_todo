import 'package:flutter/material.dart';

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
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: BoxDecoration(
          color: Color.fromRGBO(85, 83, 84, 1),
          borderRadius: BorderRadius.circular(16), // 👈 радиус скругления
        ),
        child: Center(
          child: Text(
            'Тестовая таска!',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

}