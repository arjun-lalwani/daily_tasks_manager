import 'package:flutter/material.dart';

// Colors.orange[600] = Color(0xFFFB8C00)

/* TASK SCREEN CONSTANTS */
const kTaskNumberStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Color(0xFFFB8C00),
);

const kHeadingTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 28,
  color: Color(0xFFFB8C00),
);

const kDateTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

const kSubmitButtonStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

/* WEIGHT CARD CONSTANTS */
const kWeightStyle = TextStyle(
  color: Color(0xFFFB8C00),
  fontSize: 18,
);

/* TASK CARD CONSTANTS */
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

/* SUBMIT DIALOG CONSTANTS */
const kSubmitDialogStyle = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  ),
  color: Colors.orange,
);

const kSubmitDialogTitleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const kDialogActionButtonStyle = TextStyle(
  color: Colors.orange,
  fontSize: 16,
);
