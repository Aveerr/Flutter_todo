
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ModalBottomState extends ChangeNotifier {
  TimeOfDay? _taskStartTime;
  TimeOfDay? _taskEndTime;

  // Геттеры
  TimeOfDay? get taskStartTime => _taskStartTime;
  TimeOfDay? get taskEndTime => _taskEndTime;

  // Сеттеры
  void setTaskStartTime(TimeOfDay time) {
    _taskStartTime = time;
    notifyListeners(); // обновляем UI
  }

  void setTaskEndTime(TimeOfDay time) {
    _taskEndTime = time;
    notifyListeners();
  }
}