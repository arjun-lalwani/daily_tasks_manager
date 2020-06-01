import 'package:daily_tasks_manager/model/Task.dart';
import 'package:flutter/material.dart';
import '../SubmitDialog.dart';
import '../constants.dart';
import 'DailyTaskCard.dart';
import 'WeightCard.dart';

class TaskCardsColumn extends StatelessWidget {
  final Function onSubmit;
  TaskCardsColumn({@required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
      itemCount: tasks.length + 1,
      itemBuilder: (context, index) {
        if (index < tasks.length) {
          Task task = tasks[index];
          // show weight card on top
          if (task.number == 1) {
            return WeightCard(task: task);
          } else {
            // show remaining cards as task card
            return DailyTaskCard(task: task);
          }
        }
        // submit button at the end
        return _createSubmitButton(context, onSubmit);
      },
    );
  }

  Widget _createSubmitButton(context, onSubmit) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        height: 44,
        color: Colors.orange[600],
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return SubmitDialog(context: context, saveDataCb: onSubmit);
          },
        ),
        child: Text(
          "Submit",
          style: kSubmitButtonStyle,
        ),
      ),
    );
  }
}
