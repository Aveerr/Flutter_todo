import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTimeLimit extends StatefulWidget {
  const TaskTimeLimit({super.key});

  @override
  State<TaskTimeLimit> createState() => _TaskTimeLimitState();
}

Future<TimeOfDay?> _selectTime(BuildContext context, TimeOfDay? initialTime) async {
  return await showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(), // если null — используем текущее время
  );
}

class _TaskTimeLimitState extends State<TaskTimeLimit> {
  TimeOfDay? TaskStartTime = null;
  TimeOfDay? TaskEndTime = null;
  @override
  Widget build(BuildContext context) {


    return Row(
      children: [
        Padding(padding: EdgeInsets.only(top: 50)),
        TextButton(
          onPressed: () async{
            final pick = await _selectTime(context, TaskStartTime);
            print(pick);
            if (pick != null){
              setState(() {
                TaskStartTime = pick;
              });
            }
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.access_time),
              ),
              Text(
                TaskStartTime?.format(context) ?? "начало",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ), ///Начало задачи

        Container(
          margin: EdgeInsets.all(10),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
        ), /// просто стрелочка

        TextButton(
          onPressed: () async{
            final pick = await _selectTime(context, TaskEndTime);
            print(pick);
            if (pick != null){
              setState(() {
                TaskEndTime = pick;
              });
            }
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                child: Icon(Icons.access_time),
              ),
              Text(
                TaskEndTime?.format(context) ?? "конец",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        )
      ],
    ); ///Конец задачи
  }
}