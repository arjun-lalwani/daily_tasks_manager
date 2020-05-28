import 'package:daily_tasks_manager/screens/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../Task.dart';
import 'InputDoneView.dart';

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
    KeyboardVisibilityNotification().addNewListener(onShow: () {
      KeyboardOverlay.showOverlay(context, _updateWeight);
    }, onHide: () {
      KeyboardOverlay.removeOverlay();
    });
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

  Widget _userWt() {
    if (weight.length != 0) {
      return Text('$weight kg');
    } else {
      return Icon(
        Icons.not_interested,
        color: Colors.grey,
      );
    }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Enter Weight",
                    style: kTaskTitleSyle,
                  ),
                  _userWt(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 40,
                      child: TextField(
                        controller: myController,
                        // focusNode: ,
                        onSubmitted: (_) => _updateWeight(),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "kg",
                      style: TextStyle(
                        color: Colors.orange[600],
                        fontSize: 18,
                      ),
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
}

class KeyboardOverlay {
  static OverlayEntry _overlayEntry;

  static showOverlay(BuildContext context, Function cb) {
    if (_overlayEntry != null) {
      return;
    }

    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        right: 0.0,
        left: 0.0,
        child: InputDoneView(cb: cb),
      );
    });

    overlayState.insert(_overlayEntry);
  }

  static removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }
}
