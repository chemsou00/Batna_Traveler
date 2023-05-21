import 'package:batna_traveler/controller/admin/event_controller.dart';
import 'package:batna_traveler/view/admin/functions/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDatePicker extends StatelessWidget {
  const EventDatePicker({
    super.key,
    required this.context,
    required this.controller,
  });

  final BuildContext context;
  final EventConfigController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventConfigController>(builder: (logic) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () async {
                DateTime date =
                    await datePick(context) ?? DateTime.now();
                controller.dateStart =
                    DateFormat("yyy-MM-dd").format(date);
                controller.update();
              },
              child: const Text("Date Start")),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Text(
              controller.dateStart,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                DateTime date =
                    await datePick(context) ?? DateTime.now();
                controller.dateEnd =
                    DateFormat("yyy-MM-dd").format(date);
                controller.update();
              },
              child: const Text("Date End")),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Text(
              controller.dateEnd,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      );
    });
  }
}
