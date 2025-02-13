part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final GetTaskModel model;
  HomeSuccessState(this.model);
}

final class HomeFailureState extends HomeState {
  final String message;
  HomeFailureState(this.message);
}
