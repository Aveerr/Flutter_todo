import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/todoScreen/domain/calendar_state.dart';
import 'features/todoScreen/domain/task_state.dart';
import 'features/todoScreen/presentation/todo_screen.dart';
import 'package:table_calendar/table_calendar.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarState()),
        ChangeNotifierProvider(create: (_) => TaskState()),
      ],
      child: MyApp()
    ),

  );
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
