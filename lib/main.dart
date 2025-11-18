import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/DialogWindow/domain/dialog_window_state.dart';
import 'features/modalBottomSheet/domain/modal_bottom_state.dart';
import 'theme/app_theme.dart';
import 'features/calendar/domain/calendar_state.dart';
import 'features/tasks/domain/tasks_list_state.dart';
import 'features/todoScreen/presentation/todo_screen.dart';

Future<void> main() async {
  if (kDebugMode) {
    print('Приложение запущенно');
  }

  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarState()),
        ChangeNotifierProvider(create: (_) => TaskState()),
        ChangeNotifierProvider(create: (_) => ModalBottomState()),
        ChangeNotifierProvider(create: (_) => DialogWindowState()),
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
