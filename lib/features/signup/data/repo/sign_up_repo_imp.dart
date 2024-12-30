import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_app/core/errors/errors.dart';
import 'package:task_app/core/utils/api_services.dart';
import 'package:task_app/features/signup/data/repo/sign_up_repo.dart';

class SignUpRepoImp extends SignUpRepo {
  final ApiServices _apiServices;

  SignUpRepoImp(this._apiServices);
  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp(
      String email, String password, String name) async {
    try {
      var response = await _apiServices.post('sign_up_task.php',
          data: {"email": email, "password": password, "name": name});
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
