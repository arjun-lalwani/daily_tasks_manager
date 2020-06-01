import 'package:daily_tasks_manager/screens/StatsScreen/components/cards/TwoWeekTasksCard.dart';
import 'package:daily_tasks_manager/screens/StatsScreen/components/cards/WeekTaskCards.dart';
import 'package:daily_tasks_manager/screens/StatsScreen/components/constants.dart';
import 'package:daily_tasks_manager/screens/TaskScreen/components/constants.dart';
import 'package:daily_tasks_manager/services/TasksService.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final controller = PageController(initialPage: 0);
  Future<List<dynamic>> userStats;
  int currPageNumber = 0;

  _createNewPage(newPageNumber) {
    setState(() {
      currPageNumber = newPageNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    userStats = TasksService.getUserStatsData();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Stats",
                        style: kHeadingTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _getSubHeading(),
                        style: kDateTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: userStats,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PageView.builder(
                          onPageChanged: _createNewPage,
                          controller: controller,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            var stats = snapshot.data;
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: (index == 0)
                                  ? WeekTaskCards(stats[index])
                                  : TwoWeekTasksCard(stats[index]),
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: _createPageIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSubHeading() {
    return (currPageNumber == 0)
        ? 'Daily Tasks - Week Metrics'
        : 'Daily Tasks - Past 2 Weeks Trends';
  }

  Widget _createPageIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 2,
      effect: kPageIndicatorStyle,
    );
  }
}
