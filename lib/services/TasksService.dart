import 'dart:async';
import 'dart:convert';
import 'package:daily_tasks_manager/model/Task.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum TaskStatus { loading, complete, incomplete }

class TasksService {
  static List<Task> getTasksList() {
    return tasks;
  }

  static updateTaskUserValue(Task t, var value) {
    t.userSelectedValue = value;
  }

  static saveTaskData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dateStr = DateFormat.yMd().format(DateTime.now());

    // Encode task completed status object into string for easy storage
    String userSelectedValues = jsonEncode(getCurrentTasksStatus());

    prefs.setString(dateStr, userSelectedValues);
  }

  static Future<bool> isDailyTasksCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    String dateStr = DateFormat.yMd().format(DateTime.now());

    // Check if tasks status is complete or incomplete
    return prefs.containsKey(dateStr);
  }

  static Future<List<dynamic>> getUserStatsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    WeekUserStats currWeekStats = _getCurrWeekUserStats(prefs);
    TwoWeekUserStats twoWeekStats = _getPastTwoWeeksUserStats(prefs);
    return [currWeekStats, twoWeekStats];
  }

  static WeekUserStats _getCurrWeekUserStats(prefs) {
    //  dates: from Monday to today
    DateTime toDate = DateTime.now();
    DateTime fromDate = toDate.subtract(
      Duration(days: (toDate.weekday - 1)),
    );

    WeekUserStats userStats = WeekUserStats(toDate.weekday);

    // # of days difference from Monday to today
    int datesRange = toDate.difference(fromDate).inDays;
    double lowestWt = 100;

    for (int i = 0; i <= datesRange; i++) {
      String dateStr = DateFormat.yMd().format(
        fromDate.add(Duration(days: i)),
      );

      // check if user data exists for specified date
      if (prefs.containsKey(dateStr)) {
        String taskReportStr = prefs.get(dateStr);

        // format: {"right": ["Eat Right", "Meditation", ...], "weight": "54"]
        Map<String, dynamic> taskReport = jsonDecode(taskReportStr);

        for (String taskType in taskReport.keys) {
          var userValue = taskReport[taskType]; // ["Eat Right"] or 54kg
          var weekReport = userStats.weekReport; // {right: WeekUserStats, ...}

          if (taskType == "weight") {
            lowestWt = min(lowestWt, double.parse(userValue));
            weekReport[taskType] = lowestWt.toString(); // userVal = weight
          } else {
            var userTasks = List<String>.from(userValue);
            weekReport[taskType].addTasks(userTasks); // userval = ["tasks"]
          }
        }
      }
    }
    return userStats;
  }

  static double _pastWeekWt = 100;
  static double _pastTwoWeekWt = 100;

  static TwoWeekUserStats _getPastTwoWeeksUserStats(prefs) {
    //  dates: from past two weeks cycle
    DateTime currDate = DateTime.now();
    DateTime toDate = currDate.subtract(Duration(days: currDate.weekday));
    DateTime fromDate = toDate.subtract(
      Duration(days: 14),
    );

    TwoWeekUserStats userStats = TwoWeekUserStats();

    // range of 2 weeks = 14
    for (int i = 1; i <= 14; i++) {
      String dateStr = DateFormat.yMd().format(
        fromDate.add(Duration(days: i)),
      );

      // check if user data exists for specified date
      if (prefs.containsKey(dateStr)) {
        String taskReportStr = prefs.get(dateStr);

        // format: {"right": ["Eat Right", "Meditation", ...], "weight": "54"]
        Map<String, dynamic> taskReport = jsonDecode(taskReportStr);

        for (String taskType in taskReport.keys) {
          var userValue = taskReport[taskType];
          var weekReport = userStats.weekReport;

          if (i < 8) {
            _updatePastWeekStats(taskType, userValue, weekReport);
          } else {
            _updatePastTwoWeekStats(taskType, userValue, weekReport);
          }
        }
      }
    }
    return userStats;
  }

  static _updatePastWeekStats(taskType, userValue, weekReport) {
    if (taskType == "weight") {
      _pastWeekWt = min(double.parse(userValue), _pastWeekWt);
      weekReport['pastWeekWt'] = _pastWeekWt.toString();
    } else {
      weekReport[taskType].addPastWeekTasks(List<String>.from(userValue));
    }
  }

  static _updatePastTwoWeekStats(taskType, userValue, weekReport) {
    if (taskType == "weight") {
      _pastTwoWeekWt = min(double.parse(userValue), _pastTwoWeekWt);
      weekReport['pastTwoWeekWt'] = _pastTwoWeekWt.toString();
    } else {
      weekReport[taskType].addPastTwoWeekTasks(List<String>.from(userValue));
    }
  }

  /* FOR TESTING ONLY */
  static loadOneWeekDummyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime datetime = DateTime.now();
    var dateStrList = [];
    for (int i = 0; i < datetime.weekday; i++) {
      String dateStr = DateFormat.yMd().format(
        datetime.subtract(Duration(days: i)),
      );
      dateStrList.add(dateStr);

      // Encode task completed status object into string for easy storage
      String userSelectedValues = jsonEncode(getCurrentTasksStatus());
      prefs.setString(dateStr, userSelectedValues);
    }
  }

  static loadThreeWeeksDummyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime toDate = DateTime.now();
    DateTime fromDate = toDate.subtract(Duration(days: 21));

    int datesRange = toDate.difference(fromDate).inDays;

    for (int i = 0; i < datesRange; i++) {
      String dateStr = DateFormat.yMd().format(
        fromDate.add(Duration(days: i)),
      );

      print(dateStr);

      // Encode task completed status object into string for easy storage
      String userSelectedValues = jsonEncode(getCurrentTasksStatus());
      print(userSelectedValues);
      prefs.setString(dateStr, userSelectedValues);
    }
  }

  static clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
