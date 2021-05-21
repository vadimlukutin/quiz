import 'package:quiz/app/extra/navigator/navigator.dart';
import 'package:quiz/app/fragments/quiz_string/quiz_string.dart';
import 'package:quiz/app/pages/base/base_controller.dart';
import 'package:quiz/app/pages/quiz_string/quiz_string_presenter.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';

enum QuizStringControllerState {
  in_progress,
  ready
}

class QuizStringController
    extends BaseController
    implements QuizStringFragmentDelegate
{
  var  _state = QuizStringControllerState.in_progress;

  final QuizStringPresenter presenter;

  QuizStringController()
      : presenter = QuizStringPresenter(),
        super(){
    title = "Quiz String";

    baseFragment = QuizStringFragment(delegate: this);

    presenter.getQuiz();
  }

  @override
  // this is called automatically by the parent class
  void initListeners() {
    super.initListeners();

    presenter.getQuizOnComplete = () {

      //refreshUI();
    };

    presenter.getQuizOnNext = (QuizStringList quiz) {
      (baseFragment as QuizStringFragment).data = quiz;
    };
  }

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter

    super.onDisposed();
  }

  void onNextPressed () {
    if (_state == QuizStringControllerState.ready) {
      final resultDetails = (baseFragment as QuizStringFragment).resultDetails;
      final savedResult = (baseFragment as QuizStringFragment).history;

      NavigationRoutes.openResult(
          context: baseContext,
          result: resultDetails,
          savedResult: savedResult,
      );
    }
  }

  QuizStringControllerState get state {
    return _state;
  }

  @override
  void successQuiz() {
    _state = QuizStringControllerState.ready;
  }
}
