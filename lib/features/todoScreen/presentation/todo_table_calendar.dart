import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled2/features/todoScreen/domain/calendar_state.dart';
import 'package:untitled2/theme/app_colors.dart';
class ToDoCalendar extends StatefulWidget{
  const ToDoCalendar({super.key});

  @override
  State<ToDoCalendar> createState() => _ToDoCalendarState();
}

class _ToDoCalendarState extends State<ToDoCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 35),
      child: TableCalendar(
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13,
            color: AppColors.primary,
            fontWeight: FontWeight.w200
          ), // Пн–Пт
          weekendStyle: TextStyle(
          fontFamily: 'Montserrat',
            fontSize: 13,
            color: AppColors.secondary,
            fontWeight: FontWeight.bold
          ),   // Сб–Вс
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            return Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: AppColors.primary
                  ),
                )
            );
          },
          selectedBuilder: (context, date, _) {
            return Container(
              decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      color: Color.fromRGBO(216, 213, 213, 1.0)
                  ),
                )
              ),
            );
          },
        ),
        calendarStyle: CalendarStyle(
          todayTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25,
              color: AppColors.secondary
          ),
          todayDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.arrow_left_rounded,
            color: AppColors.primary,
            size: 25,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_right_rounded,
            color: AppColors.primary,
            size: 25,
          ),
          titleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
              color: AppColors.primary
          ),
        ),
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),

        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day); // 👈 выделяет выбранную дату
        },

        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            Provider.of<CalendarState>(context, listen: false).setSelectedDay(selectedDay);
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // 👈 обновляет фокус
          });
          print('#обработка нажатия на календарь $_selectedDay $_focusedDay');
        },
        calendarFormat: CalendarFormat.week,
      ),
    );
  }
}