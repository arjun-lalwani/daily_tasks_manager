import 'package:flutter/material.dart';

import '../../Task.dart';
import 'StatIcon.dart';
import 'constants.dart';

class TwoWeekTasksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allWeekTaskData.length,
      itemBuilder: (context, index) {
        return _createTaskStatCard(allWeekTaskData[index]);
      },
    );
  }

  Widget _createTaskStatCard(WeekTaskData taskData) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      height: 82,
      decoration: kStatCardStyle,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatCardIcon(taskData: taskData),
          Expanded(
            child: _createStateDetail('2/4', 'Week 2'),
          ),
          Expanded(
            child: _createStateDetail('2/4', 'Week 1'),
          ),
          Expanded(
            child: _createStateDetail('33%', 'WoW'),
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
