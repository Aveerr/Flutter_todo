import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/task.dart';
import '../../../theme/app_colors.dart';
import '../../calendar/domain/calendar_state.dart';
import '../../tasks/domain/tasks_list_state.dart';

void showAddModalBottom(BuildContext context){
  final TextEditingController controller = TextEditingController();

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),

    backgroundColor: AppColors.third,

    builder: (context) {
      var selectedDay = context.read<CalendarState>().selectedDay;
      String date = context.watch<CalendarState>().getStringDate();

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Новая задача', style: TextStyle(fontSize: 20, color: Colors.white)),
            TextField( /// ПОЛЕ ДЛЯ ВООДА НАЗВАНИЯ ТАСКИ
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Введите названи задачи',
                hintStyle: TextStyle(color: AppColors.textPrimary),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 12),
            ElevatedButton(  /// КНОПКА ДОБАВИТЬ
              onPressed: () {
                Provider.of<TaskState>(context, listen: false)
                    .addTask(
                    date,
                    Task(
                      title: controller.text,
                      year: selectedDay.year,
                      month: selectedDay.month,
                      day: selectedDay.day,
                    )
                );
                controller.clear();
                Navigator.pop(context);
              },
              child: Text('Добавить'),
            ),
          ],
        ),
      );
    },
  );
}