import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/core/utils/api_services.dart';
import 'package:task_app/features/login/data/repo/login_repo_imp.dart';
import 'package:task_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:task_app/features/signup/data/repo/sign_up_repo_imp.dart';
import 'package:task_app/features/signup/presentation/manager/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

/// Registers all of the dependencies needed by the app with GetIt.
///
/// This should be called once at app startup.
void getItSetup() {
  getIt.registerFactory<ApiServices>(() => ApiServices(Dio()));
  getIt.registerFactory<LoginRepoImp>(
      () => LoginRepoImp(getIt.get<ApiServices>()));
  getIt
      .registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginRepoImp>()));
  getIt.registerFactory<SignUpRepoImp>(
      () => SignUpRepoImp(getIt.get<ApiServices>()));
  getIt.registerFactory<SignUpCubit>(
      () => SignUpCubit(getIt.get<SignUpRepoImp>()));
}
