import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'features/calendar/domain/calendar_state.dart';
import 'features/tasks/domain/tasks_list_state.dart';
import 'features/todoScreen/presentation/todo_screen.dart';
void main() {

  if (kDebugMode) {
    print('Приложение запущенно');
  }

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
      theme: appTheme,
      locale: const Locale('ru', 'RU'), // 👈 текущая локаль
      routes: {
        '/': (context) => const TodoScreen()
      },
    );
  }

}
