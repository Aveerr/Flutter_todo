import 'package:flutter/material.dart';

class CalendarState extends ChangeNotifier{
  late DateTime _selectedDay = DateTime.now();
  DateTime get selectedDay => _selectedDay;

  String getStringDate(){
    return '${_selectedDay.year.toString()}.${_selectedDay.month.toString()}.${_selectedDay.day.toString()}';
  }
  void setSelectedDay(DateTime day){
    _selectedDay = day;
    notifyListeners();
  }
}