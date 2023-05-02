import 'package:flutter/material.dart';

Future<void> selectDate(BuildContext context, DateTime selectedDate, Function(DateTime) onDateSelected) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) {
    onDateSelected(picked);
  }
}
