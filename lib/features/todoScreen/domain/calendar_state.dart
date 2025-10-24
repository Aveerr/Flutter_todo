import 'package:flutter/material.dart';

class CalendarState extends ChangeNotifier{
  DateTime? _selectedDay;
  DateTime? _focusedDay;

  DateTime? get selectedDay => _selectedDay;
  DateTime? get focusedDay => _focusedDay;

  void setSelectedDay(DateTime day){
    _selectedDay = day;
    notifyListeners();
  }
  void setFocusedDay(DateTime fDay){
    _focusedDay = fDay;
    notifyListeners();
  }
}