import 'dart:ffi';

import 'package:quiz/src/domain/entities/quiz_bool.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';

abstract class MainRepository {

  // GET
  Future<QuizBoolList> getQuizBool();
  Future<QuizStringList> getQuizString();
  Future<QuizHistoryList> getQuizHistory();

  // PUT
  void putQuizHistory({QuizHistoryItem quiz});
}