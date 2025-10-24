import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/todoScreen/domain/calendar_state.dart';

class ToDoTask extends StatelessWidget{
  const ToDoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: BoxDecoration(
          color: Color.fromRGBO(85, 83, 84, 1),
          borderRadius: BorderRadius.circular(16), // 👈 радиус скругления
        ),
        child: Center(
          child: Row(
            children: [
              Text(
                'Тестовая таска!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Consumer<CalendarState>(
                builder: (context, calendarState, child) {
                  return Text(' Выбранная дата: ${calendarState.selectedDay}');
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}

