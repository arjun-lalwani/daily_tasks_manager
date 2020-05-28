import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDoneView extends StatelessWidget {
  final Function callback;

  InputDoneView({this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          child: CupertinoButton(
            padding: EdgeInsets.only(right: 24, top: 8, bottom: 8),
            onPressed: () {
              // Requests for focus
              // https://flutter.dev/docs/cookbook/forms/focus
              FocusScope.of(context).requestFocus(FocusNode());
              callback();
            },
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
