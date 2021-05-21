import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';

void main() {
  //id = source["id"] as int ?? -1;
  //question = source["question"] as String ?? "";
  //rightAnswer = source["rightAnswer"] as String ?? "";
  //answers = source["answers"] as List<dynamic> ?? [];

  final id = 0;
  final question = "Test question";
  final rightAnswer = "0";
  final wrongAnswer = "wrong";
  final answers = [ "0", "1", "2", "3", "4", "5"];

  final map = {
    "id": id,
    "question": question,
    "rightAnswer": rightAnswer,
    "answers": answers
  };

  final quiz = QuizStringItem(
      source: map
  );

  test('Test QuizStringItem Map constructor', () {
    expect(quiz.id, id);
    expect(quiz.question, question);
    expect(quiz.rightAnswer, rightAnswer);
    expect(quiz.answers.length, answers.length);
  });

  test('Test QuizStringItem rightAnswer', () {
    quiz.answer = rightAnswer;

    expect(quiz.isCorrect, true);
  });

  test('Test QuizStringItem wrongAnswer', () {
    quiz.answer = wrongAnswer;

    expect(quiz.isCorrect, false);
  });
}