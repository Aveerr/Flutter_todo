import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/theme/app_colors.dart';

class Task extends StatefulWidget{
  final String title;
  int year;
  int month;
  int day;
  Task({
    super.key,
    required this.title,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String get getTitle => widget.title;
  int get getYear => widget.year;
  int get getMonth => widget.month;
  int get getDay => widget.day;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Год: ${widget.year}, Месяц: ${widget.month}, День ${widget.day}');
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 80),
          backgroundColor: AppColors.third, // цвет фона
          foregroundColor: Colors.white,      // цвет текста
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          side: BorderSide(color: AppColors.secondary, width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22), // скругление углов
          ),
          elevation: 4, // тень
        ),
        onPressed: () {
          setState(() {
            widget.year++;
          });
        },
        child: Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              'Год: ${widget.year}, Месяц: ${widget.month}, День ${widget.day}'
            )
          ],
        ),
      ),
    );
  }
}

