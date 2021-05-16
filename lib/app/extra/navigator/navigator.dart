import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/pages/history/history_view.dart';
import 'package:quiz/app/pages/home/home_view.dart';
import 'package:quiz/app/pages/quiz_bool/quiz_bool_view.dart';
import 'package:quiz/app/pages/quiz_string/quiz_string_view.dart';
import 'package:quiz/app/pages/result/result_view.dart';

class NavigationRoutes {
  static void openHome({BuildContext context}) {
    //Navigator.pushAndRemoveUntil(
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(title: "Home")
        )
    );
  }

  static void openResult({BuildContext context}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(title: "Result")),
      ModalRoute.withName('/'),
    );
  }

  static void openHistory({BuildContext context}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HistoryPage(title: "History")
        )
    );
  }

  static void openQuizString({BuildContext context}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuizStringPage(title: "Quiz String")
        )
    );
  }

  static void openQuizBool({BuildContext context}) {
    //Navigator.pushAndRemoveUntil(
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuizBoolPage(title: "Quiz Bool")
        )
    );
  }

  static void back({BuildContext context}) {
    Navigator.pop(context);
  }
}