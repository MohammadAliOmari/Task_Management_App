import 'package:dartz/dartz.dart';
import 'package:task_app/core/errors/errors.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password);
}
