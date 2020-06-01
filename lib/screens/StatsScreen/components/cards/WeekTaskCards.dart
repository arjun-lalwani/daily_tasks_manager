import 'package:daily_tasks_manager/model/Task.dart';
import 'package:daily_tasks_manager/screens/StatsScreen/components/StatIcon.dart';
import 'package:daily_tasks_manager/screens/StatsScreen/components/constants.dart';
import 'package:flutter/material.dart';
import '../Pill.dart';

class WeekTaskCards extends StatelessWidget {
  final WeekUserStats userStats;

  WeekTaskCards(this.userStats);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userStats.weekReport.length,
      itemBuilder: (context, index) {
        String taskType = userStats.weekReport.keys
            .toList()[index]; // right, wrong, weight, missed
        var userValue = userStats.weekReport[taskType];
        if (taskType == 'weight') {
          return _createWeightStatCard(userValue);
        }
        return _createTaskStatCard(context, userValue);
      },
    );
  }

  Widget _createWeightStatCard(String weight) {
    double wt = double.parse(weight);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: kStatCardStyle,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Lowest Weight",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kTitleTextStyle,
              ),
            ),
            Text(
              '$wt kg',
              style: kScoreTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTaskStatCard(BuildContext context, WeekStatCard metricData) {
    // Theme to modify out-of-box Expansion Tile
    final theme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent, // remove dividers on top and bottom
      accentColor: Colors.orange[600], // change icon color to orange
    );
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: kStatCardStyle,
      child: Theme(
        data: theme,
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    StatCardIcon(taskIcon: metricData.icon),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        "${metricData.iconTitle}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${metricData.currMetricScore}',
                style: kScoreTextStyle,
              ),
            ],
          ),
          children: [
            // Pills Menu
            _createTaskPillMenu(metricData.tasks, metricData.weekdays),
          ],
        ),
      ),
    );
  }

  Widget _createTaskPillMenu(Map<String, int> tasks, int numOfWeekdays) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10, top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          String taskTitle = tasks.keys.toList()[index];
          if (taskTitle == 'Enter Weight') return Container();
          int taskScore = tasks[taskTitle];
          return PillScoreCard(
            taskTitle: taskTitle,
            taskScore: taskScore,
            numOfWeekdays: numOfWeekdays,
          );
        },
      ),
    );
  }
}
