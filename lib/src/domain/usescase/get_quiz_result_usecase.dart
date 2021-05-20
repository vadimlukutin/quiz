import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/src/domain/entities/quiz_history.dart';
import 'package:quiz/src/domain/repositories/quiz_repository.dart';

class PutQuizHistoryUseCase
    extends UseCase <
        PutQuizHistoryUseCaseResponse,
        PutQuizHistoryUseCaseParams
    >
{
  final MainRepository repository;

  PutQuizHistoryUseCase({
    this.repository
  });

  @override
  Future<Stream<PutQuizHistoryUseCaseResponse>>
  buildUseCaseStream(PutQuizHistoryUseCaseParams params)
  async
  {
    final controller = StreamController<PutQuizHistoryUseCaseResponse>();

    try {
      // get quiz
      repository.putQuizHistory(quiz: params.quiz);

      // Adding it triggers the .onNext() in the `Observer`
      // It is usually better to wrap the response inside a response object.
      controller.add(PutQuizHistoryUseCaseResponse());

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
class PutQuizHistoryUseCaseParams {
  QuizHistoryItem quiz;

  PutQuizHistoryUseCaseParams({
    this.quiz
  });
}

/// Wrapping response inside an object makes it easier to change later
class PutQuizHistoryUseCaseResponse {
  PutQuizHistoryUseCaseResponse();
}