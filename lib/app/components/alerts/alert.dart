import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/pages/base/widget_keys.dart';

class AlertComponent {

  /// Displayed for iOS devices

  static StatelessWidget getCupertinoAlert({
    String alertText,
    String doneText,
    BuildContext context,
  }) {
    return CupertinoAlertDialog(
      key: Key(Keys.alertDialog),
      title: const Text('Alert'),
      content: Text(
          alertText,
          style: TextStyle(
              fontSize: 18,
              color: Colors.white
          )
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, doneText),
          child: Text(
              doneText,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              )
          ),
        ),
      ],
    );
  }

  /// Displayed for Android devices

  static StatelessWidget getAndroidAlert({
    String alertText,
    String doneText,
    BuildContext context,
  }) {
    return AlertDialog(
      key: Key(Keys.alertDialog),
      title: const Text('Alert'),
      content: Text(
          alertText,
          style: TextStyle(
              fontSize: 18,
              color: Colors.white
          )
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, doneText),
          child: Text(
              doneText,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              )
          ),
        ),
      ],
    );
  }
}