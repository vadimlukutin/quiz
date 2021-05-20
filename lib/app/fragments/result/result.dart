
import 'package:quiz/app/fragments/base/fragment.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/data_model/home/category.dart';
import 'package:quiz/app/list_items/data_model/result/result.dart';
import 'package:quiz/src/domain/entities/quiz_detail_result.dart';

abstract class ResultFragmentDelegate {
}

class ResultFragment
    extends Fragment{
  final QuizDetailResultList data;
  final ResultFragmentDelegate delegate;

  ResultFragment(
      {
        this.delegate,
        this.data,
      }) {
    dataList = buildDataList();
  }

  List<BaseDataItem> buildDataList() {
    var result = <BaseDataItem>[];

    var index = 1;

    for (final item in data.list) {
      var status =  item.isCorrect ? ResultStatus.correct : ResultStatus.fail;

      result.add(
          ResultDataItem(
              status: status,
              index: index,
              question: item.question,
              answer: item.answer
          )
      );

      index ++;
    }

    return result;
  }

  @override
  void onPressed({ItemType itemType}) {

  }
}