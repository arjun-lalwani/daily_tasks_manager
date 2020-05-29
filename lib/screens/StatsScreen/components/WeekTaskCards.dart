import 'package:daily_tasks_manager/screens/StatsScreen/components/StatIcon.dart';
import 'package:daily_tasks_manager/screens/StatsScreen/components/constants.dart';
import 'package:flutter/material.dart';

import '../../Task.dart';
import 'Pill.dart';

class WeekTaskCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allWeekTaskData.length,
      itemBuilder: (context, index) {
        return _createTaskStatCard(context, allWeekTaskData[index]);
      },
    );
  }

  Widget _createTaskStatCard(BuildContext context, WeekTaskData taskData) {
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
                    StatCardIcon(taskData: taskData),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        "${taskData.iconName}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${taskData.currScore}/${taskData.totalPossibleScore}',
                style: kScoreTextStyle,
              ),
            ],
          ),
          children: [
            // Pills Menu
            _createScoreDetailsMenu(),
          ],
        ),
      ),
    );
  }

  Widget _createScoreDetailsMenu() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 10, right: 10),
      padding: EdgeInsets.only(left: 10, top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sampleTasks.length,
        itemBuilder: (context, index) {
          TaskScore task = sampleTasks[index];
          return PillScoreCard(task: task);
        },
      ),
    );
  }
}
