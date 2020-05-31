import 'package:daily_tasks_manager/model/Task.dart';
import 'package:flutter/material.dart';

import 'StatIcon.dart';
import 'constants.dart';

class TwoWeekTasksCard extends StatelessWidget {
  final List<TwoWeekTaskData> lastTwoWeekData;

  TwoWeekTasksCard(this.lastTwoWeekData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lastTwoWeekData.length,
      itemBuilder: (context, index) {
        return _createTaskStatCard(lastTwoWeekData[index]);
      },
    );
  }

  Widget _createTaskStatCard(TwoWeekTaskData taskData) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      height: 82,
      decoration: kStatCardStyle,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatCardIcon(taskIcon: taskData.icon),
          Expanded(
            child:
                _createStateDetail('${taskData.pastTwoWeekScore}/28', 'Week 2'),
          ),
          Expanded(
            child: _createStateDetail('${taskData.pastWeekScore}/28', 'Week 1'),
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
}
