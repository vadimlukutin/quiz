import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/app/pages/home/home_view.dart';

void main() {
  final app = MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', ''), // English, no country code
    ],
    title: 'Quiz',
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue
    ),
    darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey
    ),
    themeMode: ThemeMode.system,
    home: HomePage(),
  );

  runApp(app);
}
