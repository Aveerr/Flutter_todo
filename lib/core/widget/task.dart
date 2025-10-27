import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/todoScreen/domain/calendar_state.dart';

class CreateTask extends StatelessWidget{
  final String title;
  const CreateTask({super.key, required this.title,  }); // ToDo: Добавить отдельный запрос на получение месяца и даты, потому что я не могу передать State Calendar ведь в таком случае он буде обновляться

  @override
  Widget build(BuildContext context) {
    final selectedDay = context.read<CalendarState>().selectedDay;
    print('dsds${selectedDay.month} ${selectedDay.day} ');
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
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                'Год: ${selectedDay.year}, Месяц: ${selectedDay.month}, День ${selectedDay.day}'
              )
            ],
          ),
        ),
      ),
    );
  }

}

