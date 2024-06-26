import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.month;

    final firstDate = DateTime(currentYear, currentMonth, 1);
    final lastDate = DateTime(currentYear, currentMonth + 1, 1)
        .subtract(const Duration(days: 1));

    return SizedBox(
      width: size.width * 0.89,
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
        onDateChanged: onDateChanged,
      ),
    );
  }

  void onDateChanged(DateTime value) {}
}
