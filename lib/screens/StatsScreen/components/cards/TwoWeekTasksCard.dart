import 'package:daily_tasks_manager/model/Task.dart';
import 'package:flutter/material.dart';
import '../StatIcon.dart';
import '../constants.dart';

class TwoWeekTasksCard extends StatelessWidget {
  final TwoWeekUserStats pastTwoWeekData;

  TwoWeekTasksCard(this.pastTwoWeekData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pastTwoWeekData.weekReport.length - 1,
      itemBuilder: (context, index) {
        var taskToValues = pastTwoWeekData.weekReport;
        String taskType = taskToValues.keys.toList()[index];
        if (taskType == 'pastWeekWt' || taskType == 'pastTwoWeekWt') {
          double pastWeekWt = double.parse(taskToValues['pastWeekWt']);
          double pastTwoWeekWt = double.parse(taskToValues['pastTwoWeekWt']);
          return _createWeightStatCard(pastWeekWt, pastTwoWeekWt);
        } else {
          return _createTaskStatCard(taskToValues[taskType]);
        }
      },
    );
  }

  Widget _createWeightStatCard(double lastWeekWt, double lastTwoWeekWt) {
    double diff = (lastWeekWt - lastWeekWt).abs();
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      height: 82,
      decoration: kStatCardStyle,
      child: Row(
        children: [
          Container(
            width: 40,
            child: Center(
              child: Text(
                "W",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: _createStateDetail('$lastWeekWt', 'Week 2'),
          ),
          Expanded(
            child: _createStateDetail('$lastTwoWeekWt', 'Week 1'),
          ),
          Expanded(
            child: _createStateDetail('$diff kg', 'Diff'),
          ),
        ],
      ),
    );
  }
}

Widget _createTaskStatCard(TwoWeekStatCard taskData) {
  return Container(
    margin: EdgeInsets.only(top: 30),
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
    height: 82,
    decoration: kStatCardStyle,
    child: Row(
      children: [
        StatCardIcon(taskIcon: taskData.icon),
        Expanded(
          child: _createStateDetail('${taskData.pastTwoWeekScore}', 'Week 2'),
        ),
        Expanded(
          child: _createStateDetail('${taskData.pastWeekScore}', 'Week 1'),
        ),
        Expanded(
          child: _createStateDetail('${taskData.changeWoW()}%', 'WoW'),
        ),
      ],
    ),
  );
}

Widget _createStateDetail(String score, String scoreTitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        score,
        style: kScoreTextStyle.copyWith(fontSize: 22),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        scoreTitle,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
    ],
  );
}
