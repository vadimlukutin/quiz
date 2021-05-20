// SELECT result.uuid, result.date, result.total, result.correct, quiz_type.name, quiz_type.type

import 'dart:typed_data';

import 'package:quiz/src/domain/entities/quiz_history.dart';

class DbQuizTypeView {
  static const stringType = "string";
  static const boolType   = "bool";
}

class DbQuizView {
  static const v_name = "quiz_view";

  static const uuid    = "uuid";
  static const date    = "date";
  static const total   = "total";
  static const correct = "correct";
  static const type    = "type";
  static const name    = "name";
}

class DbQuizTypeTable {
  static const t_name = "quiz_type";

  static const uuid    = "uuid";
  static const type    = "type";
  static const name    = "name";
}

class DbResultTable {
  static const t_name = "result";

  static const uuid     = "uuid";
  static const date     = "date";
  static const total    = "total";
  static const correct  = "correct";
  static const typeUuid = "type_uuid";
}