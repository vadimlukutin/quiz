import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/components/app_bar/base.dart';
import 'package:quiz/app/pages/quiz_bool/quiz_bool_controller.dart';

class QuizBoolPage extends View {
  QuizBoolPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _State createState(){
    return _State(controller: QuizBoolController());
  }
}

class _State
    extends ViewState<QuizBoolPage, QuizBoolController>
{

  final QuizBoolController controller;

  _State({
    this.controller
  }) : super(controller) {
    //this.controller.context = this.context;
  }

  @override
  Widget get view {
    //OrganizationHeader

    final listContainer = Expanded(
        child: Container(
          child: ControlledWidgetBuilder<QuizBoolController>(
            builder: (context, controller) {
              controller.context = context;

              return controller.baseFragment.listView;
            },
          ),
        )
    );

    final column = Column(
      children: [
        listContainer,
      ],
    );

    final safeArea = SafeArea(
      top: true,
      bottom: true,
      child: column,
    );

    final columnContainer = Container(
      child: safeArea,
      color: Colors.white,
    );

    final appBar = BaseAppBar(textTitle: controller.title);

    final result = Scaffold(
        appBar: appBar,
        body: columnContainer
    );

    return result;
  }
}

