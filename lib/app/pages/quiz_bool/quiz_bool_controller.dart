import 'package:quiz/app/extra/navigator/navigator.dart';
import 'package:quiz/app/fragments/quiz_bool/qoiz_bool.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/quiz_string/quiz_string_presenter.dart';

class QuizBoolController
    extends BaseController
    implements QuizBoolFragmentDelegate
{

  final QuizStringPresenter presenter;

  QuizBoolController()
      : presenter = QuizStringPresenter(),
        super(){
    title = "True or False Quiz";
    baseFragment = QuizBoolFragment(delegate: this);
  }

  @override
  // this is called automatically by the parent class
  void initListeners() {

  }

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter

    super.onDisposed();
  }

  void onNextPressed () {
    NavigationRoutes.openResult(context: baseContext);
  }
}
