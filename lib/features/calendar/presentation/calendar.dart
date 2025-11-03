import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled2/features/calendar/domain/calendar_state.dart';
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
      padding: const EdgeInsets.only(top: 60.0, bottom: 35),
      child: TableCalendar(
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 10,
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w100
          ), // Пн–Пт
          weekendStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 10,
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w100
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
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w300
                ),
              )
            );
          },
          selectedBuilder: (context, date, _) {
            return Container(
              decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
              child: Center(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 1.0),
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                )
              ),
            );
          },
        ),
        calendarStyle: CalendarStyle(
          todayTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 21,
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
            color: Color.fromRGBO(255, 255, 255, 1),
            size: 25,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_right_rounded,
            color: Color.fromRGBO(255, 255, 255, 1),
            size: 25,
          ),
          titleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
              color: Color.fromRGBO(255, 255, 255, 1)
          ),
        ),
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),

        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day); // 👈 выделяет выбранную дату
        },

        onDaySelected: (selectedDay, focusedDay) {
          String Date = context.read<CalendarState>().getStringDate();
          print('#todo_table_calendare обработка нажатия $Date');
          setState(() {
            Provider.of<CalendarState>(context, listen: false).setSelectedDay(selectedDay);
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // 👈 обновляет фокус
          });

        },
        calendarFormat: CalendarFormat.week,
      ),
    );
  }
}