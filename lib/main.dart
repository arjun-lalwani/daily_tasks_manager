import 'package:daily_tasks_manager/screens/TaskScreen/TasksScreen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange[600],
      ),
      home: TasksScreen(),
    );
  }
}
