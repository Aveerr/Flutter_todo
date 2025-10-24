import 'package:flutter/material.dart';
import 'features/todoScreen/domain/todo_screen.dart';
import 'package:table_calendar/table_calendar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ru', 'RU'), // 👈 текущая локаль
      routes: {
        '/': (context) => const TodoScreen()
      },
    );
  }

}
