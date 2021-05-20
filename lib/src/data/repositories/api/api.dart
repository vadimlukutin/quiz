import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:quiz/src/data/constants.dart';
import 'package:quiz/src/domain/entities/quiz_bool.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';

class ApiRepository {
  final domain = Routes.domain;
  final v = Routes.v3;

  static final ApiRepository _instance = ApiRepository._internal();

  factory ApiRepository() => _instance;

  ApiRepository._internal() {}

  Future<QuizStringList> getQuizString() async {
    var url = Uri.https(domain, v + Routes.string);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return QuizStringList(source: jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return QuizStringList(source: []);
  }

  Future<QuizBoolList> getQuizBool() async {
    var url = Uri.https(domain, v + Routes.bool);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return QuizBoolList(source: jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return QuizBoolList(source: []);
  }
}
