import 'dart:typed_data';

import 'package:quiz/src/domain/entities/db/db.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';

class DbQuizType {
  final Uint8List uuid;
  final QuizType type;
  final String name;

  DbQuizType ({
    this.uuid,
    this.name,
    this.type
  });

  DbQuizType.source({
    Map<String, Object> source
  }):
        uuid = source[DbQuizTypeTable.uuid] as Uint8List ?? Uint8List(0),
        name = source[DbQuizTypeTable.name] as String ?? Uint8List(0),
        type = getType(type: source[DbQuizTypeTable.type] as String ?? "")
  ;

  static QuizType getType({
    String type
  }) {
    switch (type) {
      case DbQuizTypeView.stringType:
        return QuizType.string;

      case DbQuizTypeView.boolType:
        return QuizType.bool;
    }

    return QuizType.none;
  }
}