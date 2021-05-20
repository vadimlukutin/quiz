import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:quiz/src/domain/entities/db/db.dart';
import 'package:quiz/src/domain/entities/db/quiz_type.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  final _path = "db/quiz.db";
  final _name = "quiz.db";

  DbQuizType _stringType;
  DbQuizType _boolType;

  Database _db;

  static final LocalDB _instance = LocalDB._internal();

  LocalDB._internal() {
    getDb();
  }
  factory LocalDB() => _instance;

  Future<Database> getDb() async {
    _db ??= await _initDb();

    _getQueryTypes();
    return _db;
  }

  // Guaranteed to be called only once.
  Future<Database> _initDb() async
  {
    String path = join(await getDatabasesPath(), this._name);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", this._path));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }

    // open the database

    final db = await openDatabase(
        path,
        readOnly: false
    );

    return db;
  }

  // Future<String> getQueryResults(String path) async {
  //   return await rootBundle.loadString(path);
  // }

  Future<QuizHistoryList> getQuizHistoryList () async {
    final list = await _db.query(
        DbQuizView.v_name,
        columns: [
          DbQuizView.uuid,
          DbQuizView.date,
          DbQuizView.total,
          DbQuizView.correct,
          DbQuizView.name,
          DbQuizView.type
        ],
        orderBy: DbQuizView.date
    );

    final result = QuizHistoryList(source: list.reversed.toList());

    return result;
  }

  void _getQueryTypes () async {
    final list = await _db.query
      (
        DbQuizTypeTable.t_name,
        columns: [
          DbQuizView.uuid,
          DbQuizView.name,
          DbQuizView.type
        ]
    );

    for (final item in list) {
      final type = item[DbQuizView.type] as String ?? "";

      switch (type) {
        case DbQuizTypeView.boolType:
          _boolType = DbQuizType.source(source: item);
          break;

        case DbQuizTypeView.stringType:
          _stringType = DbQuizType.source(source: item);
          break;
      }
    }
  }

  void insertQuizHistory ({QuizHistoryItem quiz}) {
    var values = quiz.source;

    var typeUuid = Uint8List(0);

    switch (quiz.type) {
      case QuizType.bool:
        typeUuid = _boolType.uuid;
        break;

      case QuizType.string:
        typeUuid = _stringType.uuid;
        break;

      default:
        return;
    }

    values[DbResultTable.typeUuid] = typeUuid;

    _db.insert(
        DbResultTable.t_name,
        values
    );
  }
}