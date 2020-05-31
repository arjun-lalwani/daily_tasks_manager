import 'package:daily_tasks_manager/services/TasksService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    bool isComplete = await TasksService.isDailyTasksCompleted();
    TaskStatus currStats =
        (isComplete) ? TaskStatus.complete : TaskStatus.incomplete;

    // Based on curr task status, assign the appropriate UI to display
    setState(() {
      userTaskStatusWidget = allTaskStatusWidgets[currStats];
    });
  }

  _saveTaskData() async {
    // After saving task data, update widget to display
    await TasksService.saveTaskData();
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
