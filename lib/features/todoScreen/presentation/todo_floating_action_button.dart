import 'package:flutter/material.dart';
import 'package:untitled2/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/todoScreen/domain/task_state.dart';
import 'package:untitled2/core/widget/task.dart';

import '../domain/calendar_state.dart';
class ToDoFloatingActionButton extends StatelessWidget {
  const ToDoFloatingActionButton({super.key});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        /*showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
                  primary: AppColors.secondary, // цвет акцента
                  onSurface: Colors.white, // цвет текста
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              child: child!,
            );
          }
        );*/
        /*showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),

          backgroundColor: AppColors.third,

          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Новая задача', style: TextStyle(fontSize: 20, color: Colors.white)),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Введите названи задачи',
                      hintStyle: TextStyle(color: AppColors.textPrimary),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Добавить'),
                  ),
                ],
              ),
            );
          },
        );*/
        Provider.of<TaskState>(context, listen: false).addTask(
          ToDoTask()
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      backgroundColor:AppColors.secondary,
      child: Icon(Icons.add, size: 40, color: AppColors.backgroundBottom),
    );
  }
}