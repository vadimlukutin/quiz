import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';
import 'package:quiz/src/domain/repositories/quiz_repository.dart';

class GetQuizHistoryUseCase
    extends UseCase <
        GetQuizHistoryUseCaseResponse,
        GetQuizHistoryUseCaseParams
    >
{
  final MainRepository repository;

  GetQuizHistoryUseCase({
    this.repository
  });

  @override
  Future<Stream<GetQuizHistoryUseCaseResponse>>
  buildUseCaseStream(GetQuizHistoryUseCaseParams params)
  async
  {
    final controller = StreamController<GetQuizHistoryUseCaseResponse>();

    try {
      // get history
      final history = await repository.getQuizHistory();

      // Adding it triggers the .onNext() in the `Observer`
      // It is usually better to wrap the response inside a response object.
      controller.add(GetQuizHistoryUseCaseResponse(history: history));

      logger.finest('GetQuizHistoryUseCase successful.');

      controller.close();
    } catch (e) {
      logger.severe('GetQuizHistoryUseCase unsuccessful.');

      // Trigger .onError

      controller.addError(e);
    }

    return controller.stream;
  }
}

/// Wrapping params inside an object makes it easier to change later
class GetQuizHistoryUseCaseParams {
  GetQuizHistoryUseCaseParams();
}

/// Wrapping response inside an object makes it easier to change later
class GetQuizHistoryUseCaseResponse {
  final QuizHistoryList history;

  GetQuizHistoryUseCaseResponse({
    this.history
  });
}