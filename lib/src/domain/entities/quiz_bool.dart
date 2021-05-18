class QuizBoolItem {
  int id = -1;
  String question = "";
  bool rightAnswer = false;

  QuizBoolItem({
      Map<String, dynamic> source
  }){
    id = source["id"] as int ?? -1;
    question = source["question"] as String ?? "";
    rightAnswer = source["rightAnswer"] as bool ?? false;
  }
}

class QuizBool {
  var list = <QuizBoolItem>[];

  QuizBool ({
    List<dynamic> source,
  }) {
    for(final item in source) {
      list.add(QuizBoolItem(source: item));
    }
  }
}