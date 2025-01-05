import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/add_task/data/models/add_task_model.dart';
import 'package:task_app/features/add_task/data/repos/add_task_repo.dart';
import 'package:task_app/features/login/data/repo/login_repo_imp.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.addTaskRepo) : super(AddTaskInitialState());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final AddTaskRepo addTaskRepo;
  AddTaskModel? addtaskModel;
  Future<void> addTask() async {
    emit(AddTaskLoadingState());
    var response = await addTaskRepo.addTask(titleController.text,
        descriptionController.text, dateController.text, notesController.text);
    response.fold((l) {
      emit(AddTaskFailureState(l.message));
    }, (r) {
      addtaskModel = AddTaskModel.fromJson(r);
      emit(AddTaskSuccessState(addtaskModel!));
    });
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    notesController.dispose();
    dateController.dispose();
    return super.close();
  }
}
