import 'package:dartz/dartz.dart';
import 'package:task_app/core/errors/errors.dart';

abstract class SignUpRepo {
  Future<Either<Failure, Map<String, dynamic>>> signUp(
      String email, String password, String name);
}
