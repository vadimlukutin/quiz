import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class BasePresenter extends Presenter {
  Function onError;

  BasePresenter();

  @override
  void dispose() {}
}