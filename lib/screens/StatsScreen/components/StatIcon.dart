import 'package:daily_tasks_manager/screens/Task.dart';
import 'package:flutter/material.dart';

class StatCardIcon extends StatelessWidget {
  final WeekTaskData taskData;
  StatCardIcon({this.taskData});
  @override
  Widget build(BuildContext context) {
    var iconColor;
    if (taskData.icon == Icons.close) {
      iconColor = Colors.red;
    } else if (taskData.icon == Icons.check) {
      iconColor = Colors.green;
    } else {
      iconColor = Colors.grey;
    }
    return Icon(
      taskData.icon,
      color: iconColor,
      size: 36,
    );
  }
}
