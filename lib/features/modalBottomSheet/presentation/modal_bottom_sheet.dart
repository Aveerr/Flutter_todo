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
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1.4,
                  ),
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Введите название задачи',
                    hintStyle: TextStyle(color: AppColors.textPrimary),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),

              Container(
                padding:  EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 250, 251, 1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1.4,
                  )
                ),
                child: TaskTimeLimit()
              ),
            ],
          ),
        ),
      );
    },
  );
}