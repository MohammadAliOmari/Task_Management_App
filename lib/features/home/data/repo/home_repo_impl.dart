import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_app/core/errors/errors.dart';
import 'package:task_app/features/home/data/repo/home_repo.dart';
import 'package:task_app/core/utils/api_services.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices _apiService;
  HomeRepoImpl(this._apiService);
  @override
  Future<Either<Failure, Map<String, dynamic>>> getTasks() async {
    try {
      var response = await _apiService.get('get_tasks.php');
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
