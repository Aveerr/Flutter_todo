
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
    print('#modal_bottom_state установленное время начала задачи $time');
    _taskStartTime = time;
    notifyListeners(); // обновляем UI
  }

  void setTaskEndTime(TimeOfDay time) {
    print('#modal_bottom_state установленное время конца задачи $time');
    _taskEndTime = time;
    notifyListeners();
  }
}