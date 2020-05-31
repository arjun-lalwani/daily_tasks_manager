import 'package:flutter/material.dart';

class PillScoreCard extends StatelessWidget {
  final String taskTitle;
  final int taskScore;
  final int numOfWeekdays;
  PillScoreCard({this.taskTitle, this.taskScore, this.numOfWeekdays});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.orange[600],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            '$taskTitle - ',
            style: TextStyle(
              letterSpacing: 1.0,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '$taskScore/$numOfWeekdays',
            style: TextStyle(
              letterSpacing: 1.0,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
