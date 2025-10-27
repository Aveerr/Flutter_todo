import 'package:flutter/material.dart';

class CalendarState extends ChangeNotifier{
  late DateTime _selectedDay = DateTime.now();
  late DateTime _focusedDay = DateTime.now();

  DateTime get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;

  void setSelectedDay(DateTime day){
    _selectedDay = day;
    notifyListeners();
  }
  void setFocusedDay(DateTime fDay){
    _focusedDay = fDay;
    notifyListeners();
  }
}