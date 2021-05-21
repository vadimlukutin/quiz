import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/list_items/view/list_items/base/base.dart';

enum ItemState {
  active,
  inactive
}

abstract class AnswerStringItemDelegate {
  void onPressed({
    ItemState itemState
  });
}

// ignore: must_be_immutable
class AnswerStringItem extends BaseItem {
  final AnswerStringItemDelegate delegate;
  final String text;
  ItemState itemState;

  _AnswerButton _itemButton;

  AnswerStringItem ({
    this.delegate,
    this.text,
    this.itemState = ItemState.inactive
  }) : super(null);

  @override
  Widget build(BuildContext context) {
    _itemButton = _getItemButton();

    final row = Row(
      children: [
        Expanded(
            child: _itemButton
        ),
      ],
    );

    final bodyContainer = Container(
      color: Theme.of(context).primaryColor,
      //padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: row,
    );

    final rootContainer = Container(
      child: bodyContainer,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    );

    return rootContainer;
  }

  _StateType _getStateType() {
    switch (itemState) {
      case ItemState.active:
        return _StateType.active;

      case ItemState.inactive:
        return _StateType.inactive;
    }

    return _StateType.inactive;
  }

  _AnswerButton _getItemButton () {
    return _AnswerButton(
      title: this.text,
      stateType: _getStateType(),
      onPressed: _onPressedItemButton,
    );
  }

  void _onPressedItemButton () {
    delegate.onPressed(itemState: itemState);
  }

  void active () {
    _update(itemState: ItemState.active);
  }

  void inactive () {
    _update(itemState: ItemState.inactive);
  }

  void _update ({ItemState itemState}){
    this.itemState = itemState;

    switch (itemState) {
      case ItemState.active:
        _itemButton.active();
        break;

      case ItemState.inactive:
        _itemButton.inactive();
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