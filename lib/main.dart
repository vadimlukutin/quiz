import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/app/pages/home/home_view.dart';

void main() {
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  final app = MaterialApp(
    title: 'Adviser',
    theme: ThemeData(
      // brightness: Brightness.dark,
        unselectedWidgetColor: Colors.white,
        primaryColor: Colors.blue
    ),
    home: HomePage(),
  );

  runApp(app);
}
