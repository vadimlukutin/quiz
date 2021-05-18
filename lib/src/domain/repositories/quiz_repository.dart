import 'package:quiz/src/domain/entities/quiz_bool.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';

abstract class QuizRepository {
  Future<QuizBool> getQuizBool();
  Future<QuizString> getQuizString();
}