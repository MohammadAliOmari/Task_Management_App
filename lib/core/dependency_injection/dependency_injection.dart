import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/core/utils/api_services.dart';
import 'package:task_app/features/add_task/data/repos/add_task_repo_impl.dart';
import 'package:task_app/features/add_task/presentation/manager/add_task_cubit.dart';
import 'package:task_app/features/home/data/repo/home_repo_impl.dart';
import 'package:task_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:task_app/features/login/data/repo/login_repo_imp.dart';
import 'package:task_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:task_app/features/signup/data/repo/sign_up_repo_imp.dart';
import 'package:task_app/features/signup/presentation/manager/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

/// Registers all of the dependencies needed by the app with GetIt.
///
/// This should be called once at app startup.
void getItSetup() {
  // Dio & ApiServices
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));

  // login
  getIt.registerLazySingleton<LoginRepoImp>(
      () => LoginRepoImp(getIt.get<ApiServices>()));
  getIt
      .registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginRepoImp>()));

  // Sign up
  getIt.registerLazySingleton<SignUpRepoImp>(
      () => SignUpRepoImp(getIt.get<ApiServices>()));
  getIt.registerFactory<SignUpCubit>(
      () => SignUpCubit(getIt.get<SignUpRepoImp>()));
  // Add Task
  getIt.registerLazySingleton<AddTaskRepoImpl>(
    () => AddTaskRepoImpl(getIt.get<ApiServices>()),
  );
  getIt.registerFactory<AddTaskCubit>(
      () => AddTaskCubit(getIt.get<AddTaskRepoImpl>()));
  getIt.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt.get<HomeRepoImpl>()));
}
