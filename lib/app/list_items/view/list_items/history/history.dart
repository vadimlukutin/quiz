import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/extra/utility/date_time_utility.dart';
import 'package:quiz/app/list_items/view/list_items/base/base.dart';

// ignore: must_be_immutable
class HistoryCorrectItem extends _HistoryBaseItem {
  HistoryCorrectItem({
    DateTime date,
    String quizTypeText,
    int correct,
    int total
  }):super(
    date: date,
    quizTypeText: quizTypeText,
    correct: correct,
    total: total,
  );

  @override
  Widget build(BuildContext context) {
    return getItem(color: Colors.green);
  }
}

// ignore: must_be_immutable
class HistoryFailItem extends _HistoryBaseItem {
  HistoryFailItem({
    DateTime date,
    String quizTypeText,
    int correct,
    int total
  }):super(
    date: date,
    quizTypeText: quizTypeText,
    correct: correct,
    total: total,
  );

  @override
  Widget build(BuildContext context) {
    return getItem(color: Colors.red);
  }
}

// ignore: must_be_immutable
class _HistoryBaseItem extends BaseItem {
  final DateTime date;
  final String quizTypeText;
  final int correct;
  final int total;

  _HistoryBaseItem ({
    this.date,
    this.quizTypeText,
    this.correct,
    this.total,
  }) : super(null);

  @override
  Widget build(BuildContext context) {
    return getItem(color: Colors.white);
  }

  Widget getItem({Color color}){
    final dateText = Text(
      DateTimeUtility.getDateInterval(date: date),
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 16,
          color: Colors.white),
    );

    final text = Text(
      this.quizTypeText,
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 22,
          color: Colors.white),
    );

    final row = Row(
      children: [
        Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: text,
            )
        ),
        dateText,
      ],
    );

    final resultTextWidget = Text(
      "Result: $correct/$total",
      textAlign: TextAlign.right,
      style: TextStyle(
          fontSize: 16,
          color: Colors.white),
    );

    final column = Column(
      children: [
        row,

            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: resultTextWidget,
            )

      ],
    );

    final bodyContainer = Container(
      color: color,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: column,
    );

    final rootContainer = Container(
      child: GestureDetector(
        child: bodyContainer,
        onTap: this.onItemPressed,
      ),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
    );

    return rootContainer;
  }
}