import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/view/list_items/base/base.dart';

// ignore: must_be_immutable
class QuestionItem extends BaseItem {
  final int index;
  final String text;

  QuestionItem ({
    this.index,
    this.text,
  }) : super(null);

  @override
  Widget build(BuildContext context) {
    final indexText = Text(
      "$index.",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 22,
          color: Colors.white),
    );

    final text = Text(
      this.text,
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 22,
          color: Colors.white),
    );

    final row = Row(
      children: [
        FittedBox(
            child: indexText
        ),
        Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: text,
            )
        )
      ],
    );

    final bodyContainer = Container(
      color: Colors.blue,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: row,
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