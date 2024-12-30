import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_app/core/errors/errors.dart';
import 'package:task_app/core/utils/api_services.dart';
import 'package:task_app/features/login/data/repo/login_repo.dart';

class LoginRepoImp extends LoginRepo {
  final ApiServices _apiServices;
  LoginRepoImp(this._apiServices);
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password) async {
    try {
      var response = await _apiServices
          .post('login.php', data: {"email": email, "password": password});
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
