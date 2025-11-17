import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/modal_bottom_state.dart';

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
  TimeOfDay? TaskStartTime;
  TimeOfDay? TaskEndTime;
  @override
  Widget build(BuildContext context) {
    final modalState = context.read<ModalBottomState>();

    return Center(
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          Container(
            width: 130,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1.4,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: TextButton(
              onPressed: () async{
                final pick = await _selectTime(context, TaskStartTime);
                print(pick);
                modalState.setTaskStartTime(pick!);
                setState(() {
                  TaskStartTime = pick;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.access_time,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    TaskStartTime?.format(context) ?? "начало",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
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
          ),

          Container(
            width: 130,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1.4,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: TextButton(
              onPressed: () async{
                final pick = await _selectTime(context, TaskEndTime);
                print(pick);
                modalState.setTaskEndTime(pick!);

                setState(() {
                  TaskEndTime = pick;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.access_time,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    TaskEndTime?.format(context) ?? "конец",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ); ///Конец задачи
  }
}