import 'package:flutter/material.dart';

/// A service to help with creating buttons
class ButtonsService {
  ///
  /// Create and return a close button
  ///
  static FlatButton close(BuildContext context) {
    return FlatButton(
      child: Text("Close"),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
