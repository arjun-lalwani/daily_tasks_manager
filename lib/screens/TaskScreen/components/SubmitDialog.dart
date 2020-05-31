import 'package:daily_tasks_manager/model/Task.dart';
import 'package:daily_tasks_manager/screens/TaskScreen/components/constants.dart';
import 'package:flutter/material.dart';

// Completed Refactoring
class SubmitDialog extends StatelessWidget {
  final BuildContext context;
  final Function saveDataCb;

  SubmitDialog({@required this.context, @required this.saveDataCb});

  String _showAppropriateMessage() {
    int totalTasks = tasks.length;

    // Calculate number of tasks user has completed
    int numOfTasksCompleted = tasks
        .where(
          (task) => (task.userSelectedValue != null),
        )
        .toList()
        .length;

    // Append encouraging or inspiring messages to user
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
        decoration: kSubmitDialogStyle,
        child: Text(
          'Today\'s Tasks',
          style: kSubmitDialogTitleStyle,
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
        _createActionButton('Dismiss', () {
          Navigator.of(context).pop();
        }),
        _createActionButton('Approve', () {
          saveDataCb();
          Navigator.of(context).pop();
        }),
      ],
    );
  }

  Widget _createActionButton(String btnTitle, Function cb) {
    return FlatButton(
      child: Text(
        '$btnTitle',
        style: kDialogActionButtonStyle,
      ),
      onPressed: cb,
    );
  }
}
