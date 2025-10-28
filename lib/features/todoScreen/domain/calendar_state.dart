import 'package:flutter/material.dart';

class CalendarState extends ChangeNotifier{
  late DateTime _selectedDay = DateTime.now();

  DateTime get selectedDay => _selectedDay;

  void setSelectedDay(DateTime day){
    _selectedDay = day;
    notifyListeners();
  }

}