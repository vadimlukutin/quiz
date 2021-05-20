import 'dart:typed_data';

import 'package:quiz/src/domain/entities/db/db.dart';

enum QuizType {
  none,
  string,
  bool
}

class QuizHistoryItem {
  final Uint8List uuid;
  final DateTime date;
  final int total;
  final int correct;
  final String name;
  final QuizType type;

  QuizHistoryItem({
   this.type,
   this.uuid,
   this.date,
   this.name = "",
   this.correct,
   this.total
  });

  QuizHistoryItem.source({
    Map<String, Object> source
  }):
        uuid    = source[DbQuizView.uuid] as Uint8List ?? "",
        date    = DateTime.fromMicrosecondsSinceEpoch(
            source[DbQuizView.date] as int ?? 0
        ),
        total   = source[DbQuizView.total] as int ?? 0,
        correct = source[DbQuizView.correct] as int ?? 0,
        name    = source[DbQuizView.name] as String ?? "",
        type    = getType(type: source[DbQuizView.type] as String ?? "")
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

  Map<String, Object> get source {
    var result = <String, Object>{};

    result[DbResultTable.uuid]    = this.uuid;
    result[DbResultTable.date]    = this.date.microsecondsSinceEpoch;
    result[DbResultTable.total]   = this.total;
    result[DbResultTable.correct] = this.correct;

    return result;
  }
}

class QuizHistoryList {
  var list = <QuizHistoryItem>[];

  QuizHistoryList({
    List<Map<String, Object>> source,
  }) {
      for (final item in source) {
        list.add(QuizHistoryItem.source(source: item));
      }
  }
}