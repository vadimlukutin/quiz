import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/app/pages/base/base_presenter.dart';
import 'package:quiz/src/data/repositories/repository.dart';
import 'package:quiz/src/domain/usescase/get_quiz_bool_usecase.dart';

class QuizBoolPresenter extends BasePresenter {
  Function getQuizOnNext;
  Function getQuizOnComplete;

  GetQuizBoolUseCase getQuizUseCase;

  QuizBoolPresenter() {
    getQuizUseCase = GetQuizBoolUseCase(
        repository: DataQuizRepository()
    );
  }

  void getQuiz() {
    getQuizUseCase.execute(
        _GetUseCaseObserver(this),
        GetQuizBoolUseCaseParams()
    );
  }

  @override
  void dispose() {
    getQuizUseCase.dispose();
  }
}

class _GetUseCaseObserver extends Observer<GetQuizBoolUseCaseResponse> {
  final QuizBoolPresenter presenter;

  _GetUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getQuizOnComplete != null);

    presenter.getQuizOnComplete();
  }

  @override
  void onError(e) {
//    assert(presenter.getOnError != null);

    presenter.onError(e);
  }

  @override
  void onNext(response) {
    presenter.getQuizOnNext(response.quiz);
  }
}