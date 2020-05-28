import 'package:daily_tasks_manager/screens/components/constants.dart';
import 'package:flutter/material.dart';

import '../Task.dart';

class DailyTaskCard extends StatefulWidget {
  final Task task;
  DailyTaskCard({@required this.task});

  @override
  _DailyTaskCardState createState() => _DailyTaskCardState();
}

class _DailyTaskCardState extends State<DailyTaskCard>
    with AutomaticKeepAliveClientMixin {
  String _userOptionSelected = "";
  @override
  bool get wantKeepAlive => true;

  _userOptionTap(bool isCheck) {
    if (isCheck) {
      setState(() {
        _userOptionSelected = "check";
        widget.task.userSelectedValue = _userOptionSelected;
      });
    } else {
      setState(() {
        _userOptionSelected = "cancel";
        widget.task.userSelectedValue = _userOptionSelected;
      });
    }
  }

  Widget _userSelectedOptionIcon() {
    if (_userOptionSelected.length > 0) {
      return (_userOptionSelected == "check")
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : Icon(
              Icons.close,
              color: Colors.red,
            );
    }
    return Icon(
      Icons.not_interested,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TASK ${widget.task.number}',
          style: kTaskNumberStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // margin: Edge,
          padding: EdgeInsets.fromLTRB(14, 14, 14, 6),
          height: 110,
          width: double.infinity,
          decoration: kTaskCardStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.task.title}',
                    style: kTaskTitleSyle,
                  ),
                  _userSelectedOptionIcon(),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () => _userOptionTap(false),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.green,
                      disabledColor: Colors.yellow,
                      onPressed: () => _userOptionTap(true),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
