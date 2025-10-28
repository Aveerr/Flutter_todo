import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/todoScreen/domain/task_state.dart';
import 'package:untitled2/core/widget/task.dart';
import 'package:untitled2/features/todoScreen/domain/calendar_state.dart';

class ToDoFloatingActionButton extends StatefulWidget {
  const ToDoFloatingActionButton({super.key});

  @override
  State<ToDoFloatingActionButton> createState() => _ToDoFloatingActionButtonState();
}

class _ToDoFloatingActionButtonState extends State<ToDoFloatingActionButton> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (kDebugMode) {
          print('Созданна новая задача');
        }
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
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),

          backgroundColor: AppColors.third,

          builder: (context) {
            var selectedDay = context.read<CalendarState>().selectedDay;
            String Date = selectedDay.year.toString() + selectedDay.month.toString() + selectedDay.day.toString();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Новая задача', style: TextStyle(fontSize: 20, color: Colors.white)),

                  TextField( /// ПОЛЕ ДЛЯ ВООДА НАЗВАНИЯ ТАСКИ
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Введите названи задачи',
                      hintStyle: TextStyle(color: AppColors.textPrimary),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),

                  SizedBox(height: 12),

                  ElevatedButton( /// КНОПКА ДОБАВИТЬ
                    onPressed: () {
                      //print((context.read<TaskState>().task[0].year));

                      Provider.of<TaskState>(context, listen: false)
                      .addTask(
                      CreateTask(
                          title: _controller.text,
                          year: selectedDay.year,
                          month: selectedDay.month,
                          day: selectedDay.day,
                        ),
                        Date
                      );

                      print(Date);
                      _controller.clear();
                      Navigator.pop(context);
                    },
                    child: Text('Добавить'),
                  ),
                ],
              ),
            );
          },
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