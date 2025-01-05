import 'package:dartz/dartz.dart';
import 'package:task_app/core/errors/errors.dart';

abstract class AddTaskRepo {
  Future<Either<Failure, Map<String, dynamic>>> addTask(
      String title, String description, String date, String notes);
}
