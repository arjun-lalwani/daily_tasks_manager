import 'package:daily_tasks_manager/screens/Task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'components/DailyTaskCard.dart';
import 'components/SubmitDialog.dart';
import 'components/WeightCard.dart';
import 'components/constants.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String dateStr = DateFormat.MMMMEEEEd().format(DateTime.now());
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Arjun",
                style: kHeadingTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 12),
                child: Text(
                  dateStr,
                  style: kDateTextStyle,
                ),
              ),
              Expanded(
                child: ListView.builder(
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
                    return _createSubmitButotn();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createSubmitButotn() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        height: 44,
        color: Colors.orange[600],
        onPressed: () => SubmitDialog(context: context).show(),
        child: Text(
          "Submit",
          style: kSubmitButtonStyle,
        ),
      ),
    );
  }
}
