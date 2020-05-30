import 'package:flutter/material.dart';

// For Todo Screen
class Task {
  String title;
  int number;
  dynamic userSelectedValue =
      Icons.not_interested; // by default user has not selected any value

  Task({this.title, this.number});
}

List<Task> tasks = [
  Task(title: 'Enter Weight', number: 1),
  Task(title: 'Eat Right', number: 2),
  Task(title: 'Meditation', number: 3),
  Task(title: 'Exercise', number: 4),
  Task(title: 'Introspection', number: 5),
];

Map<IconData, int> iconToIndexMap = {
  Icons.cancel: 0,
  Icons.check: 1,
  Icons.not_interested: 2,
};

// Return Map: {taskTitle: userSelectedValue}
// Example: {Enter Weight: 64, Eat Right: 1, Meditation: 0, Exercise: 1, Introspection: 2}
Map<String, dynamic> getTasksStatus() {
  Map<String, dynamic> taskStatus = {};
  for (int i = 0; i < tasks.length; i++) {
    Task task = tasks[i];
    var value;

    // If user selected value is of type Icon,
    // convert into values between 0 and 2
    // where 0 = X icon; 1 = check icon; 2 = not interested icon
    if (task.userSelectedValue.runtimeType == IconData) {
      value = iconToIndexMap[task.userSelectedValue];
    } else {
      // when user selected value is a double (ex: user weight)
      value = task.userSelectedValue;
    }
    taskStatus[task.title] = value;
  }
  return taskStatus;
}

// For Stats Screen
// Dummy DATA
class WeekTaskData {
  IconData icon;
  List<TaskScore> tasks;
  int currScore;
  int totalPossibleScore = 28;
  String iconName;

  WeekTaskData(this.icon, this.tasks, this.currScore) {
    if (this.icon == Icons.check) {
      iconName = "Right";
    } else if (this.icon == Icons.close) {
      iconName = "Wrong";
    } else {
      iconName = "Opportunities Missed";
    }
  }
}

List<WeekTaskData> allWeekTaskData = [
  WeekTaskData(Icons.check, sampleTasks, 12),
  WeekTaskData(Icons.close, sampleTasks, 14),
  WeekTaskData(Icons.not_interested, sampleTasks, 10),
];

class TaskScore {
  String category;
  int score;

  TaskScore(this.category, this.score);
}

List<TaskScore> sampleTasks = [
  TaskScore("Eat", 3),
  TaskScore("Meditate", 4),
  TaskScore("Introspect", 3),
  TaskScore("Exercise", 4)
];
