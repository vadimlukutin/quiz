import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/app/pages/base/base_presenter.dart';
import 'package:quiz/src/data/repositories/repository.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';
import 'package:quiz/src/domain/usescase/get_quiz_result_usecase.dart';

class ResultPresenter
    extends BasePresenter
{
  Function putQuizHistoryOnNext;
  Function putQuizHistoryOnComplete;

  PutQuizHistoryUseCase putQuizHistoryUseCase;

  ResultPresenter() {
    putQuizHistoryUseCase = PutQuizHistoryUseCase(
        repository: DataQuizRepository()
    );
  }

  void putQuizResult({QuizHistoryItem quiz}) {
    putQuizHistoryUseCase.execute(
        _PutHistoryUseCaseObserver(this),
        PutQuizHistoryUseCaseParams(quiz: quiz)
    );
  }

  @override
  void dispose() {
    putQuizHistoryUseCase.dispose();
  }
}

class _PutHistoryUseCaseObserver
    extends Observer<PutQuizHistoryUseCaseResponse> {
  final ResultPresenter presenter;

  _PutHistoryUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.putQuizHistoryOnComplete != null);

    presenter.putQuizHistoryOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.onError != null);

    presenter.onError(e);
  }

  @override
  void onNext(response) {
    presenter.putQuizHistoryOnNext();
  }
}