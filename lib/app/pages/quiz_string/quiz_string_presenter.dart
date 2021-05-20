import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/app/pages/base/base_presenter.dart';
import 'package:quiz/src/data/repositories/repository.dart';
import 'package:quiz/src/domain/usescase/get_quiz_string_usecase.dart';

class QuizStringPresenter extends BasePresenter {
  Function getQuizOnNext;
  Function getQuizOnComplete;

  GetQuizStringUseCase getQuizUseCase;

  QuizStringPresenter() {
    getQuizUseCase = GetQuizStringUseCase(
        repository: DataQuizRepository()
    );
  }

  void getQuiz() {
    getQuizUseCase.execute(
        _GetUseCaseObserver(this),
        GetQuizStringUseCaseParams()
    );
  }

  @override
  void dispose() {
    getQuizUseCase.dispose();
  }
}

class _GetUseCaseObserver extends Observer<GetQuizStringUseCaseResponse> {
  final QuizStringPresenter presenter;

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