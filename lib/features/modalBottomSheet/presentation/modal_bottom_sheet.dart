import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/app_colors.dart';
import '../../calendar/domain/calendar_state.dart';
import 'modal_bottom_task_timer.dart';
import 'modal_bottom_top_bar.dart';

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
              TopBar(selectedDay: selectedDay, date: date, controller: controller),
              TaskTimeLimit(),
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