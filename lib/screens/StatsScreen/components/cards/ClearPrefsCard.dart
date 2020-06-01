import 'package:daily_tasks_manager/services/TasksService.dart';
import 'package:flutter/material.dart';

class ClearPrefsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 40),
          child: MaterialButton(
            elevation: 4,
            color: Colors.red,
            onPressed: () {
              TasksService.clearPrefs();
            },
            child: Text(
              "Clear Data",
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    );
  }
}
