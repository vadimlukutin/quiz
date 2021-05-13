import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class BaseItem extends Container {
  VoidCallback onItemPressed;

  BaseItem(this.onItemPressed);

  //@mustCallSuper
  void initComponents (){

  }
}