import 'package:flutter/material.dart';

class StatCardIcon extends StatelessWidget {
  final IconData taskIcon;
  StatCardIcon({this.taskIcon});
  @override
  Widget build(BuildContext context) {
    var iconColor;
    if (taskIcon == Icons.close) {
      iconColor = Colors.red;
    } else if (taskIcon == Icons.check) {
      iconColor = Colors.green;
    } else {
      iconColor = Colors.grey;
    }
    return Icon(
      taskIcon,
      color: iconColor,
      size: 36,
    );
  }
}
