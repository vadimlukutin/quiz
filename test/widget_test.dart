// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/pages/base/widget_keys.dart';
import 'package:quiz/app/pages/home/home_view.dart';
import 'package:quiz/app/pages/quiz_string/quiz_string_view.dart';

void main() {
  testWidgets('HomePage list test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.byType(ListView), findsOneWidget);

    expect(find.text("True or False Quiz"), findsOneWidget);
    expect(find.text("One Answer Quiz"), findsOneWidget);
    expect(find.text("History"), findsOneWidget);
  });
}
