import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/theme/app_colors.dart';
import '../../modalBottomSheet/presentation/modal_bottom_sheet.dart' show showAddModalBottom;

class ToDoFloatingActionButton extends StatefulWidget {
  const ToDoFloatingActionButton({super.key});

  @override
  State<ToDoFloatingActionButton> createState() => _ToDoFloatingActionButtonState();
}

class _ToDoFloatingActionButtonState extends State<ToDoFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (kDebugMode) {
          print('Созданна новая задача');
        }
        /*showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
                  primary: AppColors.secondary, // цвет акцента
                  onSurface: Colors.white, // цвет текста
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              child: child!,
            );
          }
        );*/

        showAddModalBottom(context);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      backgroundColor:AppColors.secondary,
      child: Icon(Icons.add, size: 40, color: AppColors.backgroundBottom),
    );
  }
}