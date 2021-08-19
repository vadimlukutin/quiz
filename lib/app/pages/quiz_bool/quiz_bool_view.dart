import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/app/components/alerts/alert.dart';
import 'package:quiz/app/components/app_bar/base.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/base/widget_keys.dart';
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

    final button = Container(
      height: 80.0,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: ControlledWidgetBuilder<QuizBoolController>(
        builder: (context, controller) {
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)
            ),
            key: Key(Keys.next),
            child: Text(
              "Next",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white
              ),
            ),
            onPressed: () {
              if (controller.state == QuizBoolControllerState.ready) {
                controller.onNextPressed();
              } else {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    final alertText = "Check all answers";
                    final doneText = "OK";

                    switch(controller.device) {
                      case DeviceType.ios:
                        return AlertComponent.getCupertinoAlert(alertText: alertText, doneText: doneText, context: context);
                        break;

                      case DeviceType.android:
                      default:
                      return AlertComponent.getAndroidAlert(alertText: alertText, doneText: doneText, context: context);
                        break;
                    }
                  },
                );
              }
            },
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
      //color: Colors.white,
    );

    final appBar = BaseAppBar(textTitle: controller.title);

    final result = Scaffold(
        appBar: appBar,
        body: columnContainer
    );

    return result;
  }
}

