import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quiz/src/domain/entities/quiz_string.dart';
import 'package:quiz/src/domain/repositories/quiz_repository.dart';

class GetQuizStringUseCase
    extends UseCase <
        GetQuizStringUseCaseResponse,
        GetQuizStringUseCaseParams
    >
{
  final QuizRepository repository;

  GetQuizStringUseCase({
    this.repository
  });

  @override
  Future<Stream<GetQuizStringUseCaseResponse>>

  buildUseCaseStream(GetQuizStringUseCaseParams params)

  async
  {
    final controller = StreamController<GetQuizStringUseCaseResponse>();

    try {
      // get user
      final quiz = await repository.getQuizString();

      // Adding it triggers the .onNext() in the `Observer`
      // It is usually better to wrap the response inside a response object.
      controller.add(GetQuizStringUseCaseResponse(quiz: quiz));

      logger.finest('GetUserUseCase successful.');

      controller.close();
    } catch (e) {
      logger.severe('GetUserUseCase unsuccessful.');

      // Trigger .onError

      controller.addError(e);
    }

    return controller.stream;
  }
}

/// Wrapping params inside an object makes it easier to change later
class GetQuizStringUseCaseParams {
  GetQuizStringUseCaseParams();
}

/// Wrapping response inside an object makes it easier to change later
class GetQuizStringUseCaseResponse {
  final QuizString quiz;

  GetQuizStringUseCaseResponse({
    this.quiz
  });
}