import 'package:daily_tasks_manager/screens/TaskScreen/components/Cards/WeightCard.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// For Todo Screen
class Task {
  String title;
  int number;
  dynamic userSelectedValue; // by default user has not selected any value

  Task({this.title, this.number}) {
    if (title == 'Enter Weight') {
      userSelectedValue = 0;
    } else {
      userSelectedValue = Icons.not_interested;
    }
  }
}

List<Task> tasks = [
  Task(title: 'Enter Weight', number: 1),
  Task(title: 'Eat Right', number: 2),
  Task(title: 'Meditation', number: 3),
  Task(title: 'Exercise', number: 4),
  Task(title: 'Introspection', number: 5),
];

// Return Map: {taskTitle: userSelectedValue}
// Example: {Enter Weight: 64, Eat Right: Icons.check, Meditation: Icons.close, .....}
Map<String, dynamic> getCurrentTasksStatus() {
  Map<String, dynamic> taskStatus = {
    "right": [],
    "wrong": [],
    "missed": [],
    "weight": "0",
  };

  for (int i = 0; i < tasks.length; i++) {
    Task task = tasks[i];
    var userVal = task.userSelectedValue;
    if (userVal == Icons.check) {
      taskStatus["right"].add(task.title);
    } else if (userVal == Icons.close) {
      taskStatus["wrong"].add(task.title);
    } else if (userVal == Icons.not_interested) {
      taskStatus["missed"].add(task.title);
    } else {
      taskStatus["weight"] = userVal.toString();
    }
  }
  return taskStatus;
}

Map<String, dynamic> getRandomCurrentTasksStatus() {
  Map<String, dynamic> taskStatus = {};
  for (int i = 0; i < tasks.length; i++) {
    Task task = tasks[i];
    taskStatus[task.title] = task.userSelectedValue.toString();
  }
  return taskStatus;
}

class TwoWeekUserStats {
  Map<String, dynamic> weekReport;

  TwoWeekUserStats() {
    weekReport = {
      "right": TwoWeekStatCard(Icons.check),
      "wrong": TwoWeekStatCard(Icons.close),
      "missed": TwoWeekStatCard(Icons.not_interested),
      "pastWeekWt": "0",
      "pastTwoWeekWt": "0",
    };
  }
}

class TwoWeekStatCard {
  IconData icon;
  int pastWeekScore = 0;
  int pastTwoWeekScore = 0;

  TwoWeekStatCard(this.icon);

  addPastWeekTasks(List<String> taskTitles) {
    pastWeekScore += taskTitles.length;
  }

  addPastTwoWeekTasks(List<String> taskTitles) {
    pastTwoWeekScore += taskTitles.length;
  }

  int changeWoW() {
    int diff = pastWeekScore - pastTwoWeekScore;
    return ((diff / 28) * 100).toInt();
  }
}

class WeekUserStats {
  int weekdays;
  Map<String, dynamic> weekReport;

  WeekUserStats(this.weekdays) {
    weekReport = {
      "right": WeekStatCard(Icons.check, weekdays),
      "wrong": WeekStatCard(Icons.close, weekdays),
      "missed": WeekStatCard(Icons.not_interested, weekdays),
      "weight": "0",
    };
  }
}

// For Stats Scree
class WeekStatCard {
  IconData icon;
  String iconTitle;
  Map<String, int> tasks;
  int currMetricScore;
  int weekdays;
  int possibleMetricScore;

  WeekStatCard(this.icon, this.weekdays) {
    if (this.icon == Icons.check) {
      iconTitle = "Right";
    } else if (this.icon == Icons.close) {
      iconTitle = "Wrong";
    } else {
      iconTitle = "Opportunities Missed";
    }
    currMetricScore = 0;
    possibleMetricScore = weekdays * 4;
    tasks = {
      'Eat Right': 0,
      'Meditation': 0,
      'Exercise': 0,
      'Introspection': 0,
    };
  }

  addTask(String taskTitle) {
    currMetricScore++;
    if (tasks.containsKey(taskTitle)) {
      tasks[taskTitle] = tasks[taskTitle] + 1;
    } else {
      tasks[taskTitle] = 1;
    }
  }

  addTasks(List<String> taskTitles) {
    for (String taskTitle in taskTitles) {
      addTask(taskTitle);
    }
  }
}
