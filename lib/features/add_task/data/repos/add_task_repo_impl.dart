import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_app/core/errors/errors.dart';
import 'package:task_app/core/utils/api_services.dart';
import 'package:task_app/features/add_task/data/repos/add_task_repo.dart';

class AddTaskRepoImpl extends AddTaskRepo {
  final ApiServices _apiServices;

  AddTaskRepoImpl(this._apiServices);
  @override
  Future<Either<Failure, Map<String, dynamic>>> addTask(String title,
      String description, String date, String notes, int roleid) async {
    try {
      var response = await _apiServices.post('add_task.php', data: {
        "title": title,
        "description": description,
        "deadline": date,
        "notes": notes,
        "role_id": roleid
      });
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
