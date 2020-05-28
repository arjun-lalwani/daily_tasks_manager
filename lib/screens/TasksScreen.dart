import 'package:daily_tasks_manager/screens/Task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/DailyTaskCard.dart';
import 'components/WeightCard.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String dateStr = DateFormat.MMMMEEEEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Arjun",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Colors.orange[600],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 12),
                child: Text(
                  dateStr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  itemCount: tasks.length + 1,
                  itemBuilder: (context, index) {
                    if (index < tasks.length) {
                      Task task = tasks[index];
                      if (task.number == 1) {
                        return WeightCard(task: task);
                      } else {
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: DailyTaskCard(task: task),
                        );
                      }
                    } else {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                          height: 44,
                          color: Colors.orange[600],
                          onPressed: () {
                            var x = tasks.map((task) => task.userSelectedValue);
                            print(x);
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
