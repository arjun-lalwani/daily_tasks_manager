import 'package:flutter/material.dart';

const kTaskNumberStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Color(0xFFFB8C00),
);

final kTaskCardStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  border: Border.all(
    color: Colors.orange,
  ),
  boxShadow: [
    BoxShadow(
      blurRadius: 4,
      spreadRadius: 2,
      color: Colors.grey,
      offset: Offset(0, 4),
    )
  ],
);

const kTaskTitleSyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
