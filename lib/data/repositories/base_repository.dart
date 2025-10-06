import 'package:flutter/foundation.dart';
import 'package:vms_flutter_client/core/base_response.dart';

typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();

abstract class BaseRepository {
  const BaseRepository();

  Future<Either<Failure, T>> catchError<T>(FutureEitherOr<T> body) async {
    try {
      return await body();
    } on Failure catch (e) {
      return Left(e);
    } catch (error) {
      return Left(kReleaseMode ? Failure.defaultError() : Failure.message(error.toString()));
    }
  }
}
