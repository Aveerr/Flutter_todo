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
    isScrollControlled: true, // важно для адаптации под клавиатуру
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      final selectedDay = context.read<CalendarState>().selectedDay;
      final date = context.watch<CalendarState>().getStringDate();

      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // учитывает клавиатуру
          left: 16,
          right: 16,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // важно!
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.transparent, width: 0),
                        minimumSize: const Size(100, 80),
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
                      child: Text('Отменить')
                    ),
                    Expanded(
                        child: Text(
                            'Новая задача',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center,
                        )
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 80),
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
                        child: Text('Добавить')
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Введите название задачи',
                  hintStyle: TextStyle(color: AppColors.textPrimary),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 2),

            ],
          ),
        ),
      );
    },
  );
}