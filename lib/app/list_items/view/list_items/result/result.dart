import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/view/list_items/base/base.dart';

// ignore: must_be_immutable
class ResultCorrectItem extends _ResultBaseItem {
  ResultCorrectItem({
    int index,
    String questionText,
    String answerText
  }):super(
    index: index,
    questionText: questionText,
    answerText: answerText
  );

  @override
  Widget build(BuildContext context) {
    return getItem(color: Colors.green);
  }
}

// ignore: must_be_immutable
class ResultFailItem extends _ResultBaseItem {
  ResultFailItem({
    int index,
    String questionText,
    String answerText
  }):super(
      index: index,
      questionText: questionText,
      answerText: answerText
  );

  @override
  Widget build(BuildContext context) {
    return getItem(color: Colors.red);
  }
}

// ignore: must_be_immutable
class _ResultBaseItem extends BaseItem {
  final int index;
  final String questionText;
  final String answerText;

  _ResultBaseItem ({
    this.index,
    this.questionText,
    this.answerText
  }) : super(null);

  @override
  Widget build(BuildContext context) {
    return getItem(color: Colors.white);
  }

  Widget getItem({Color color}){
    final indexText = Text(
      "$index.",
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 22,
          color: Colors.white),
    );

    final text = Text(
      this.questionText,
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 22,
          color: Colors.white),
    );

    final row = Row(
      children: [
        indexText,
        Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: text,
            )
        )
      ],
    );

    final answerTextWidget = Text(
      this.answerText,
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 22,
          color: Colors.white),
    );

    final column = Column(
      children: [
        row,
        answerTextWidget
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