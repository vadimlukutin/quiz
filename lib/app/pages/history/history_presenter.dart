import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/app/pages/base/base_presenter.dart';
import 'package:quiz/src/data/repositories/repository.dart';
import 'package:quiz/src/domain/usescase/get_quiz_history_usecase.dart';

class HistoryPresenter extends BasePresenter {
  Function getQuizOnNext;
  Function getQuizOnComplete;

  GetQuizHistoryUseCase getQuizUseCase;

  HistoryPresenter() {
    getQuizUseCase = GetQuizHistoryUseCase(
        repository: DataQuizRepository()
    );
  }

  void getHistoryList() {
    getQuizUseCase.execute(
        _GetUseCaseObserver(this),
        GetQuizHistoryUseCaseParams()
    );
  }

  @override
  void dispose() {
    getQuizUseCase.dispose();
  }
}

class _GetUseCaseObserver extends Observer<GetQuizHistoryUseCaseResponse> {
  final HistoryPresenter presenter;

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
    presenter.getQuizOnNext(response.history);
  }
}