import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/* STAT SCREEN */

const kPageIndicatorStyle = SlideEffect(
  dotHeight: 12,
  dotWidth: 12,
  activeDotColor: Colors.orange,
  dotColor: Colors.grey,
);

/* STAT CARDS */
final kStatCardStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  border: Border.all(color: Colors.orange),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      blurRadius: 2,
      spreadRadius: 2,
      color: Colors.grey,
      offset: Offset(0, 4),
    )
  ],
);

const kTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 22,
);

final kScoreTextStyle = TextStyle(
  color: Colors.black,
  letterSpacing: 1.0,
  fontSize: 24,
);
