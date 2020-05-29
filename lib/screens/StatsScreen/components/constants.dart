/* STAT CARDS */

import 'package:flutter/material.dart';

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
