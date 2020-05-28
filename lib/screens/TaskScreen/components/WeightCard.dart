import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import '../../Task.dart';

import 'KeyboardOverlay.dart';
import 'constants.dart';

class WeightCard extends StatefulWidget {
  final Task task;
  WeightCard({this.task});

  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String weight = "";
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Get notified when keyboard is active
    // Call overlay method to add Done Button on top of number pad
    KeyboardVisibilityNotification().addNewListener(
      onShow: () {
        KeyboardOverlay.showOverlay(context, _updateWeight);
      },
      onHide: () {
        KeyboardOverlay.removeOverlay();
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  _updateWeight() {
    setState(() {
      weight = myController.text;
      widget.task.userSelectedValue = weight;
      myController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TASK 1',
          style: kTaskNumberStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(14),
          height: 100,
          width: double.infinity,
          decoration: kTaskCardStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createTaskInfoRow(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: _createTextFieldContainer(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "kg",
                      style: kWeightStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createTextFieldContainer() {
    return Container(
      height: 40,
      child: TextField(
        controller: myController,
        onSubmitted: (_) => _updateWeight(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }

  Widget _createTaskInfoRow() {
    var userWtValue;
    if (weight.length != 0) {
      userWtValue = Text('$weight kg');
    } else {
      userWtValue = Icon(
        Icons.not_interested,
        color: Colors.grey,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Enter Weight",
          style: kTaskTitleSyle,
        ),
        userWtValue,
      ],
    );
  }
}
