import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/view/list_items/quiz_bool/answer_bool.dart';

abstract class AnswerBoolDataItemDelegate {
  void onAnswerBoolPressed({
    AnswerBoolState state,
    String uuid
  });
}

enum AnswerBoolState {
  none,
  positive,
  negative
}

class AnswerBoolDataItem
    extends BaseDataItem
    implements AnswerBoolItemDelegate
{
  final AnswerBoolDataItemDelegate delegate;
  final String uuid;
  final String positiveText = "YES";
  final String negativeText = "NO";

  var _state = AnswerBoolState.none;

  AnswerBoolDataItem({
    this.delegate,
    this.uuid
  });

  Widget getWidgetItem() {
    var itemState = ItemState.none;

    switch (_state) {
      case AnswerBoolState.negative:
        itemState = ItemState.negative;
        break;

      case AnswerBoolState.positive:
        itemState = ItemState.positive;
        break;

      case AnswerBoolState.none:
        itemState = ItemState.none;
        break;
    }

    return AnswerBoolItem(
      delegate: this,
      itemState: itemState,
      positiveText: positiveText,
      negativeText: negativeText,
    );
  }

  @override
  void onPressed({ItemState itemState}) {
    switch(itemState) {
      case ItemState.positive:
        _state = AnswerBoolState.positive;
        break;

      case ItemState.negative:
        _state = AnswerBoolState.negative;
        break;

      default:
        _state = AnswerBoolState.none;
        break;
    }

    delegate.onAnswerBoolPressed(uuid: uuid, state: _state);
  }
}