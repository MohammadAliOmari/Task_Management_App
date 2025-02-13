import 'package:dartz/dartz.dart';
import 'package:task_app/core/errors/errors.dart';

abstract class HomeRepo {
  Future<Either<Failure, Map<String, dynamic>>> getTasks();
}
