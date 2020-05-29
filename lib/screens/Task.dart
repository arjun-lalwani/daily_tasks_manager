import 'package:flutter/material.dart';

// For Todo Screen
class Task {
  String title;
  int number;
  var userSelectedValue;

  Task({this.title, this.number});
}

List<Task> tasks = [
  Task(title: 'Enter Weight', number: 1),
  Task(title: 'Eat Right', number: 2),
  Task(title: 'Meditation', number: 3),
  Task(title: 'Exercise', number: 4),
  Task(title: 'Introspection', number: 5),
];

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
      iconName = "Opportunities\nMissed";
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
