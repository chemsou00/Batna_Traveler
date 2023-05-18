import 'package:flutter/material.dart';

Future<DateTime?> datePick(BuildContext context) {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030));
}
