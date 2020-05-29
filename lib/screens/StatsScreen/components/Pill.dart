import 'package:flutter/material.dart';

import '../../Task.dart';

class PillScoreCard extends StatelessWidget {
  final TaskScore task;
  PillScoreCard({this.task});

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
            '${task.category} - ',
            style: TextStyle(
              letterSpacing: 1.0,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '${task.score}/7',
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
