import 'package:daily_tasks_manager/screens/StatsScreen/components/TwoWeekTasksCard.dart';
import 'package:daily_tasks_manager/screens/StatsScreen/components/WeekTaskCards.dart';
import 'package:daily_tasks_manager/screens/TaskScreen/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final controller = PageController(initialPage: 0);
  int currPageNumber = 0;

  _createNewPage(newPageNumber) {
    print(newPageNumber);
    setState(() {
      currPageNumber = newPageNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              child: PageView.builder(
                onPageChanged: _createNewPage,
                controller: controller,
                itemCount: 2,
                itemBuilder: (context, index) {
                  var childCard =
                      (index == 0) ? WeekTaskCards() : TwoWeekTasksCard();
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: childCard,
                  );
                },
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: _createPageIndicator(),
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
      effect: SlideEffect(
        dotHeight: 12,
        dotWidth: 12,
        activeDotColor: Colors.orange,
        dotColor: Colors.grey,
      ),
    );
  }
}
