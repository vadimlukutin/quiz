import 'package:quiz/src/data/repositories/api/api.dart';
import 'package:quiz/src/data/repositories/local_data/local_data.dart';
import 'package:quiz/src/domain/entities/quiz_bool.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';
import 'package:quiz/src/domain/repositories/quiz_repository.dart';

class DataQuizRepository
    extends MainRepository
{
  final api = ApiRepository();
  final local = LocalDB();

  static final DataQuizRepository _instance = DataQuizRepository._internal();

  DataQuizRepository._internal();

  factory DataQuizRepository() => _instance;

  @override
  Future<QuizStringList> getQuizString() async {
    return api.getQuizString();
  }

  @override
  Future<QuizBoolList> getQuizBool() async {
    return api.getQuizBool();
  }

  @override
  Future<QuizHistoryList> getQuizHistory() {
    return local.getQuizHistoryList();
  }

  @override
  void putQuizHistory({QuizHistoryItem quiz}) {
    local.insertQuizHistory(quiz: quiz);
  }
}