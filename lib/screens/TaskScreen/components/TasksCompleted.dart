import 'package:flutter/material.dart';

class TasksCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('images/micky_mouse.jpg'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "You're all done for today.",
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Come back tomorrow! :)",
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
