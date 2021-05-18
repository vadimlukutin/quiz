import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/data_model/base.dart';
import 'package:quiz/app/list_items/view/list_items/quiz_string/answer_string.dart';

abstract class AnswerStringDataItemDelegate {
  void onAnswerStringPressed({
    AnswerStringState state,
    int questionId,
    String answer,
  });
}

enum AnswerStringState {
  active,
  inactive,
}

class AnswerStringDataItem
    extends BaseDataItem
    implements AnswerStringItemDelegate
{
  final AnswerStringDataItemDelegate delegate;
  final int questionId;
  final String text;

  var _state = AnswerStringState.inactive;

  AnswerStringItem _item;

  AnswerStringDataItem({
    this.delegate,
    this.text,
    this.questionId
  });

  Widget getWidgetItem() {
    var itemState = ItemState.inactive;

    switch (_state) {
      case AnswerStringState.active:
        itemState = ItemState.active;
        break;

      case AnswerStringState.inactive:
        itemState = ItemState.inactive;
        break;
    }

    return _item = AnswerStringItem(
      delegate: this,
      itemState: itemState,
      text: text,
    );
  }

  void active() {
    _update(state: AnswerStringState.active);
  }

  void inactive() {
    _update(state: AnswerStringState.inactive);
  }

  void _update({AnswerStringState state}){
    _state = state;

    if (_item != null) {
      switch (state) {
        case AnswerStringState.active:
          _item.active();
          break;

        case AnswerStringState.inactive:
          _item.inactive();
          break;
      }
    }
  }

  @override
  void onPressed({ItemState itemState}) {
    delegate.onAnswerStringPressed(
        questionId: questionId,
        state: _state,
        answer: text
    );
  }
}