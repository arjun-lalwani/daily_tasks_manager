import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDoneView extends StatelessWidget {
  final Function cb;
  InputDoneView({this.cb});
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
                FocusScope.of(context).requestFocus(FocusNode());
                cb();
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
        ));
  }
}
