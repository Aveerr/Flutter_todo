
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/DialogWindow/domain/dialog_window_state.dart';
import '../../features/DialogWindow/presentation/dialog_window.dart';

class Task extends StatefulWidget{
  String _title = '';
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _day = DateTime.now().day;
  TimeOfDay? _taskStartTime;
  TimeOfDay? _taskEndTime;

  // Геттеры
  String get title => _title;
  int get year => _year;
  int get month => _month;
  int get day => _day;
  TimeOfDay? get taskStartTime => _taskStartTime;
  TimeOfDay? get taskEndTime => _taskEndTime;

  void setTitle(String value) {
    _title = value;
  }
  void setYear(int value) {
    _year = value;
  }
  void setMonth(int value) {
    _month = value;
  }
  void setDay(int value) {
    _day = value;
  }
  void setTaskStartTime(TimeOfDay value) {
    _taskStartTime = value;
  }
  void setTaskEndTime(TimeOfDay value) {
    _taskEndTime = value;
  }


  Task({
    super.key,
    required String title,
    required TimeOfDay taskStartTime,
    required TimeOfDay taskEndTime,
    required int year,
    required int month,
    required int day,
  }) : _taskEndTime = taskEndTime, _taskStartTime = taskStartTime, _day = day, _month = month, _year = year, _title = title;
  bool isChecked = false;


  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  @override
  Widget build(BuildContext context) {
    final dialogState = context.watch<DialogWindowState>();

    if (kDebugMode) {
      print('#task: Отрисованна задача - Title: ${widget.title}, StartTime: ${widget.taskStartTime}, EndTime: ${widget.taskEndTime}, День ${widget.day}');
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
          showDialogWindow(context, widget.title, widget);
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
                  '${widget.taskStartTime?.hour}:${widget.taskStartTime?.minute} - ${widget.taskEndTime?.hour}:${widget.taskEndTime?.minute} ',
                    style: TextStyle(color: Colors.grey, fontSize: 16)
                )
              ],
            ),
            Spacer(),
            Checkbox(
              activeColor: Color.fromRGBO(60, 159, 174, 1),
              value: widget.isChecked,

              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value ?? false;
                });
              },)
          ],
        ),
      ),
    );
  }
}

