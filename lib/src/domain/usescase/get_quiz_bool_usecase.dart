import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/src/domain/entities/quiz_bool.dart';
import 'package:quiz/src/domain/repositories/quiz_repository.dart';

class GetQuizBoolUseCase
    extends UseCase <
        GetQuizBoolUseCaseResponse,
        GetQuizBoolUseCaseParams
    >
{
  final MainRepository repository;

  GetQuizBoolUseCase({
    this.repository
  });

  @override
  Future<Stream<GetQuizBoolUseCaseResponse>>
  buildUseCaseStream(GetQuizBoolUseCaseParams params)
  async
  {
    final controller = StreamController<GetQuizBoolUseCaseResponse>();

    try {
      // get quiz
      final quiz = await repository.getQuizBool();

      // Adding it triggers the .onNext() in the `Observer`
      // It is usually better to wrap the reponse inside a respose object.
      controller.add(GetQuizBoolUseCaseResponse(quiz: quiz));

      logger.finest('GetQuizBoolUseCase successful.');

      controller.close();
    } catch (e) {
      logger.severe('GetQuizBoolUseCase unsuccessful.');

      // Trigger .onError

      controller.addError(e);
    }

    return controller.stream;
  }
}

/// Wrapping params inside an object makes it easier to change later
class GetQuizBoolUseCaseParams {
  GetQuizBoolUseCaseParams();
}

/// Wrapping response inside an object makes it easier to change later
class GetQuizBoolUseCaseResponse {
  final QuizBoolList quiz;

  GetQuizBoolUseCaseResponse({
    this.quiz
  });
}