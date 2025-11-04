import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widget/task.dart';
import '../../tasks/domain/tasks_list_state.dart';

class TopBar extends StatelessWidget {
  final DateTime selectedDay;
  final TextEditingController controller;
  final date;
  const TopBar({
    super.key,
    required this.selectedDay,
    required this.controller,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: Colors.transparent, width: 0),
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                Navigator.pop(context);
                if (kDebugMode) {
                  print('#moddal_bottom отменено создание задачи');
                }
              },
              child: Text('Отменить')
          ), ///ОТМЕНИТЬ ЗАДАЧУ
          Expanded(
              child: Text(
                'Новая задача',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              )
          ), ///НОВАЯ ЗАДАЧА НАДПИСЬ
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: Colors.transparent, width: 0),
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                Provider.of<TaskState>(context, listen: false).addTask(
                  date,
                  Task(
                    title: controller.text,
                    year: selectedDay.year,
                    month: selectedDay.month,
                    day: selectedDay.day,
                  ),
                );
                controller.clear();
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.access_time),
                  Text('Добавить'),
                ],
              )
          ), /// СОЗДАТЬ ЗАДАЧУ
        ],
      ),
    );
  }

}