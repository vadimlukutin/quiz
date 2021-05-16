import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/components/app_bar/base.dart';
import 'package:quiz/app/pages/result/result_controller.dart';

class ResultPage extends View {
  ResultPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _State createState(){
    return _State(controller: ResultController());
  }
}

class _State
    extends ViewState<ResultPage, ResultController>
{
  final ResultController controller;

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
          child: ControlledWidgetBuilder<ResultController>(
            builder: (context, controller) {
              controller.context = context;

              return controller.baseFragment.listView;
            },
          ),
        )
    );

    final button = Container(
      height: 80.0,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: ControlledWidgetBuilder<ResultController>(
        builder: (context, controller) {
          return ElevatedButton(
            child: Text(
              "Finish",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white),
            ),
            onPressed: controller.onFinishPressed,
          );
        },
      ),
    );

    final column = Column(
      children: [
        listContainer,
        button,
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

