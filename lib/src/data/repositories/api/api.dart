import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:quiz/src/data/constants.dart';
import 'package:quiz/src/domain/entities/quiz_bool.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';
import 'package:quiz/src/domain/repositories/quiz_repository.dart';

class DataQuizRepository
  extends QuizRepository
{
  final domain = Routes.domain;
  final v = Routes.v3;

  static final DataQuizRepository _instance = DataQuizRepository._internal();

  DataQuizRepository._internal() {
    // users = <User>[];
    // users.addAll([
    //   User('test-uid', 'John Smith', 18),
    //   User('test-uid2', 'John Doe', 22)
    // ]);
  }
  factory DataQuizRepository() => _instance;

  @override
  Future<QuizString> getQuizString() async {
    var url = Uri.https(domain, v + Routes.string);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return QuizString(source: jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return QuizString(source: []);
  }

  @override
  Future<QuizBool> getQuizBool() async {
    var url = Uri.https(domain, v + Routes.bool);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return QuizBool(source: jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return QuizBool(source: []);
  }
}