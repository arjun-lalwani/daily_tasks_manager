import 'package:flutter/material.dart';

import 'InputDoneView.dart';

// Ensure Done button row appears on top of numberpad keyboard (iOS)
class KeyboardOverlay {
  static OverlayEntry _overlayEntry;

  static showOverlay(BuildContext context, Function cb) {
    if (_overlayEntry != null) {
      return;
    }

    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        /// When a mobile device's keyboard is visible `viewInsets.bottom`
        /// corresponds to the top of the keyboard.
        bottom: MediaQuery.of(context).viewInsets.bottom,
        right: 0.0,
        left: 0.0,
        child: InputDoneView(callback: cb),
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
