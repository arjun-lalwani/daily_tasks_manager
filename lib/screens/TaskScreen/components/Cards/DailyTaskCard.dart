import 'package:flutter/material.dart';
import '../../../Task.dart';
import '../constants.dart';

class DailyTaskCard extends StatefulWidget {
  final Task task;
  DailyTaskCard({@required this.task});

  @override
  _DailyTaskCardState createState() => _DailyTaskCardState();
}

class _DailyTaskCardState extends State<DailyTaskCard>
    with AutomaticKeepAliveClientMixin {
  Icon _userOptionSelected = Icon(Icons.not_interested, color: Colors.grey);

  // ListView.builder remembers to keep state when
  // card not displayed on screen
  @override
  bool get wantKeepAlive => true;

  _userOptionTap({bool isCheck}) {
    if (isCheck) {
      setState(() {
        _userOptionSelected = Icon(Icons.check, color: Colors.green);
        widget.task.userSelectedValue = _userOptionSelected.icon;
      });
    } else {
      setState(() {
        _userOptionSelected = Icon(Icons.close, color: Colors.red);
        widget.task.userSelectedValue = _userOptionSelected.icon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
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
                    _userOptionSelected,
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                _createUserOptionButtonsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createUserOptionButtonsRow() {
    return Row(
      children: [
        Expanded(
          child: _userOptionButton(Icons.close, false),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: _userOptionButton(Icons.check, true),
        ),
      ],
    );
  }

  Widget _userOptionButton(IconData icon, bool isCheck) {
    return MaterialButton(
      color: (icon == Icons.check) ? Colors.green : Colors.red,
      disabledColor: Colors.yellow,
      onPressed: () => _userOptionTap(isCheck: isCheck),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
