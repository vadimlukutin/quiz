import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/view/list_items/base/base.dart';

// ignore: must_be_immutable
class HomeItem extends BaseItem {
  final title;

  HomeItem ({
    this.title,
    VoidCallback onItemPressed
  }) : super(onItemPressed);

  @override
  Widget build(BuildContext context) {
    final bodyContainer = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.fromLTRB(15, 35, 15, 35),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 22,
            color: Colors.white
        ),
      ),
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