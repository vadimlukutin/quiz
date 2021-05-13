import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseAppBar
    extends  AppBar {
  final String textTitle;

  BaseAppBar({
    this.textTitle
  }) : super(
    backgroundColor: Colors.blue,
    title: Text(
        textTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
            color: Colors.white
        )
    ),
  );
}



