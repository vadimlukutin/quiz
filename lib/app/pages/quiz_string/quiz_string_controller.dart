import 'package:quiz/app/extra/navigator/navigator.dart';
import 'package:quiz/app/fragments/quiz_string/quiz_string.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/quiz_string/quiz_string_presenter.dart';

class QuizStringController
    extends BaseController
    implements QuizStringFragmentDelegate
{

  final QuizStringPresenter presenter;

  QuizStringController()
      : presenter = QuizStringPresenter(),
        super(){
    title = "Quiz String";
    baseFragment = QuizStringFragment(delegate: this);
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
