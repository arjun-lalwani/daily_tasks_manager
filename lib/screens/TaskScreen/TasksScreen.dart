import 'dart:convert';
import 'package:daily_tasks_manager/screens/Task.dart';
import 'package:daily_tasks_manager/screens/TaskScreen/components/Cards/DailyTaskCard.dart';
import 'package:daily_tasks_manager/screens/TaskScreen/components/Cards/WeightCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/SubmitDialog.dart';

import 'components/constants.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime date = DateTime.now();
  int tabIndex = 0;
  Widget userStatus;
  List<Widget> userStatusWidgets;

  @override
  void initState() {
    super.initState();
    _dailyTasksCompleted();
    userStatusWidgets = [
      CircularProgressIndicator(),
      TasksColumn(onSubmit: _saveTaskData),
      TasksCompleted(),
    ];
    userStatus = userStatusWidgets[0];
  }

  _dailyTasksCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    String dateStr = DateFormat.yMd().format(date);
    var tasksStatusIndex = (prefs.containsKey(dateStr)) ? 2 : 1;
    setState(() {
      userStatus = userStatusWidgets[tasksStatusIndex];
    });
  }

  _saveTaskData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dateStr = DateFormat.yMd().format(DateTime.now());

    // Encode task status Map into a String to store in shared pref
    String userSelectedValues = jsonEncode(getTasksStatus());
    prefs.setString(dateStr, userSelectedValues);
    // print(userSelectedValues);
    setState(() {
      userStatus = userStatusWidgets[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    String dateStr = DateFormat.MMMMEEEEd().format(date);
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
                child: userStatus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TasksCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('images/micky_mouse.jpg'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "You're all done for today.",
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Come back tomorrow! :)",
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class TasksColumn extends StatelessWidget {
  final Function onSubmit;
  TasksColumn({@required this.onSubmit});

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
