import 'package:daily_tasks_manager/screens/StatsScreen/StatsScreen.dart';
import 'package:daily_tasks_manager/screens/TaskScreen/TasksScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  _onTabItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  var destinations = [TasksScreen, StatsScreen];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            TasksScreen(),
            StatsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabItemTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Todo"),
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            title: Text("Stats"),
            icon: Icon(Icons.insert_chart),
          ),
        ],
      ),
    );
  }
}
