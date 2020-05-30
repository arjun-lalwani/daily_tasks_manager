import 'package:flutter/material.dart';
import '../../Task.dart';

class SubmitDialog extends StatelessWidget {
  final BuildContext context;
  final Function saveDataCb;

  SubmitDialog({@required this.context, @required this.saveDataCb});

  String _showAppropriateMessage() {
    int totalTasks = tasks.length;
    int numOfTasksCompleted =
        tasks.where((task) => (task.userSelectedValue != null)).toList().length;
    String message = "$numOfTasksCompleted of $totalTasks tasks completed!\n";
    if (numOfTasksCompleted < totalTasks) {
      int remainingTasks = totalTasks - numOfTasksCompleted;
      message +=
          'Just $remainingTasks more to go. Remember to make growth a habit.';
    } else {
      message += 'Fantastic. Consistency is key. :)';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    String message = _showAppropriateMessage();
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.orange,
        ),
        child: Text(
          'Today\'s Tasks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text('$message'),
          ],
        ),
      ),
      actions: [
        FlatButton(
          child: Text(
            'Dismiss',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 16,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            'Approve',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 16,
            ),
          ),
          onPressed: () {
            saveDataCb();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
