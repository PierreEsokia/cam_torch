import '../error/failure/failure.dart';
import 'package:dartz/dartz.dart';

/// An abstract base class representing a use case in the application.
///
/// A use case is a high-level business logic operation that can be performed.
/// It takes an input parameter of type [P] and returns a result
/// wrapped in an [Either] containing either a [Failure] or the result of type [T].

abstract class UseCase<T, P> {
  /// Executes the use case with the provided [params].
  /// The method [call] is called by simply call [UseCase],
  /// so we don't need to call [UseCase.call]
  Future<Either<Failure, T?>> call(P params);
}