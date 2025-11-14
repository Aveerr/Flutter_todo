import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget{
  final String title;
  final int year;
  final int month;
  final int day;
  final TimeOfDay taskStartTime;
  final TimeOfDay taskEndTime;

  Task({
    super.key,
    required this.title,
    required this.taskStartTime,
    required this.taskEndTime,
    required this.year,
    required this.month,
    required this.day,
  });

  void setTitle(){
    //this.title = "d";
  }

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;
  String get getTitle => widget.title;
  int get getYear => widget.year;
  int get getMonth => widget.month;
  int get getDay => widget.day;
  TimeOfDay get getTaskStartTime => widget.taskStartTime;
  TimeOfDay get getTaskEndTime => widget.taskEndTime;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('#task: Отрисованна задача - Title: ${widget.title}, StartTime: ${widget.taskStartTime}, День ${widget.day}');
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 80),
          backgroundColor: Colors.white, // цвет фона
          foregroundColor: Colors.black,      // цвет текста
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          side: BorderSide(color: Colors.white, width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // скругление углов
          ),
          elevation: 4, // тень
        ),
        
        onPressed: () {
          setState(() {

          });
        },
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                Text(
                  '${getTaskStartTime.hour}:${getTaskStartTime.minute} - ${getTaskEndTime.hour}:${getTaskEndTime.minute} ',
                    style: TextStyle(color: Colors.grey, fontSize: 16)
                )
              ],
            ),
            Spacer(),
            Checkbox(
              activeColor: Color.fromRGBO(60, 159, 174, 1),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },)
          ],
        ),
      ),
    );
  }
}

