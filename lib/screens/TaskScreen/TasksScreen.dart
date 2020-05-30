import 'dart:convert';
import 'package:daily_tasks_manager/screens/Task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/Cards/TaskCardsColumn.dart';
import 'components/TasksCompleted.dart';
import 'components/constants.dart';

enum TaskStatus { loading, complete, incomplete }

// Completed Refactoring
class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime date = DateTime.now();
  Widget userTaskStatusWidget;
  Map<TaskStatus, Widget> allTaskStatusWidgets;

  @override
  void initState() {
    super.initState();
    // check if user has completed tasks
    _isDailyTasksCompleted();

    // store all possible task status widgets
    allTaskStatusWidgets = {
      TaskStatus.loading: CircularProgressIndicator(),
      TaskStatus.incomplete: TaskCardsColumn(onSubmit: _saveTaskData),
      TaskStatus.complete: TasksCompleted(),
    };

    // set current user task status to loading
    userTaskStatusWidget = allTaskStatusWidgets[TaskStatus.loading];
  }

  _isDailyTasksCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    String dateStr = DateFormat.yMd().format(date);

    // Check if tasks status is complete or incomplete
    var currTaskStatus = (prefs.containsKey(dateStr))
        ? TaskStatus.complete
        : TaskStatus.incomplete;

    // Based on curr task status, assign the appropriate UI to display
    setState(() {
      userTaskStatusWidget = allTaskStatusWidgets[currTaskStatus];
    });
    // prefs.clear();
  }

  _saveTaskData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dateStr = DateFormat.yMd().format(DateTime.now());

    // Encode task completed status object into string for easy storage
    String userSelectedValues = jsonEncode(getTasksStatus());
    prefs.setString(dateStr, userSelectedValues);
    setState(() {
      userTaskStatusWidget = allTaskStatusWidgets[TaskStatus.complete];
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
                child: userTaskStatusWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
