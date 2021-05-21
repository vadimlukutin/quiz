import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/view/list_items/base/base.dart';

enum ItemState {
  none,
  positive,
  negative
}

abstract class AnswerBoolItemDelegate {
  void onPressed({
    ItemState itemState
  });
}

// ignore: must_be_immutable
class AnswerBoolItem extends BaseItem {
  final AnswerBoolItemDelegate delegate;
  final String positiveText;
  final String negativeText;
  ItemState itemState;

  _AnswerButton _positiveButton;
  _AnswerButton _negativeButton;

  AnswerBoolItem ({
    this.delegate,
    this.positiveText = "YES",
    this.negativeText = "NO",
    this.itemState = ItemState.none
  }) : super(null);

  @override
  Widget build(BuildContext context) {
    _positiveButton = _getPositiveButton();
    _negativeButton = _getNegativeButton();

    final row = Row(
      children: [
        Expanded(
            child: _positiveButton
        ),
        Expanded(
            child: _negativeButton
        )
      ],
    );

    final bodyContainer = Container(
      color: Theme.of(context).primaryColor,
      //padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: row,
    );

    final rootContainer = Container(
      child: bodyContainer,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
    );

    return rootContainer;
  }

  _AnswerButton _getPositiveButton () {
    var state = _StateType.inactive;

    switch (itemState) {
      case ItemState.positive:
        state = _StateType.active;
        break;

      case ItemState.negative:
        state = _StateType.inactive;
        break;

      case ItemState.none:
        state = _StateType.inactive;
        break;
    }

    return _AnswerButton(
      title: this.positiveText,
      stateType: state,
      onPressed: _onPressedPositiveButton,
    );
  }

  _AnswerButton _getNegativeButton () {
    var state = _StateType.inactive;

    switch (itemState) {
      case ItemState.positive:
        state = _StateType.inactive;
        break;

      case ItemState.negative:
        state = _StateType.active;
        break;

      case ItemState.none:
        state = _StateType.inactive;
        break;
    }

    return _AnswerButton(
      title: this.negativeText,
      stateType: state,
      onPressed: _onPressedNegativeButton,
    );
  }

  void _onPressedPositiveButton () {
    _update (itemState: ItemState.positive);
  }

  void _onPressedNegativeButton () {
    _update (itemState: ItemState.negative);
  }

  void _update ({ItemState itemState}){
    this.itemState = itemState;

    delegate.onPressed(itemState: itemState);

    switch (itemState) {
      case ItemState.positive:
        _positiveButton.active();
        _negativeButton.inactive();
        break;

      case ItemState.negative:
        _positiveButton.inactive();
        _negativeButton.active();
        break;

      case ItemState.none:
        _positiveButton.inactive();
        _negativeButton.active();
        break;
    }
  }
}

enum _StateType {
  active,
  inactive
}

// ignore: must_be_immutable
class _AnswerButton extends StatefulWidget {
  final VoidCallback onPressed;
  _State _state;
  _StateType stateType;
  final String title;

  final activeColor = Colors.green;
  final inactiveColor = Colors.transparent;

  final activeTextColor = Colors.white;
  final inactiveTextColor = Colors.white;

  _AnswerButton({
    this.stateType,
    this.title,
    this.onPressed
  });

  @override
  State<_AnswerButton> createState() {
    _state = _State();

    return  _state;
  }

  void active () {
    this.stateType = _StateType.active;

    // ignore: invalid_use_of_protected_member
    _state.setState(() {

    });
  }

  void inactive () {
    this.stateType = _StateType.inactive;

    // ignore: invalid_use_of_protected_member
    _state.setState(() {

    });
  }
}

class _State extends State<_AnswerButton> {
  @override
  Widget build(BuildContext context) {
    switch(widget.stateType) {
      case _StateType.active:
        return getActive();

      case _StateType.inactive:
      default:
        return getInactive();
    }
  }

  Widget getActive () {
    return _getButton(
      title: widget.title,
      color: widget.activeColor,
      textColor: widget.activeTextColor
    );
  }

  Widget getInactive () {
    return _getButton(
        title: widget.title,
        color: widget.inactiveColor,
        textColor: widget.inactiveTextColor
    );
  }

  Widget _getButton ({
    title: String,
    color: Color,
    textColor: Color,
  }) {
    final text = Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 22,
          color: textColor),
    );

    final result = GestureDetector(
      onTap: widget.onPressed,
      child: Container (
        //height: 100,
        color: color,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: text,
      ),
    );

    return result;
  }
}