part of 'add_task_cubit.dart';

abstract class AddTaskState {}

final class AddTaskInitialState extends AddTaskState {}

final class AddTaskLoadingState extends AddTaskState {}

final class AddTaskSuccessState extends AddTaskState {}

final class AddTaskFailureState extends AddTaskState {
  final String message;
  AddTaskFailureState(this.message);
}
