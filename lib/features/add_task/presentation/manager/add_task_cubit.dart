import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/add_task/data/models/add_task_model.dart';
import 'package:task_app/features/add_task/data/repos/add_task_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.addTaskRepo) : super(AddTaskInitialState());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AddTaskRepo addTaskRepo;
  int selectedRole = 2;
  AddTaskModel? addtaskModel;
  Future<void> addTask() async {
    emit(AddTaskLoadingState());
    var response = await addTaskRepo.addTask(
        titleController.text,
        descriptionController.text,
        dateController.text,
        notesController.text,
        selectedRole);
    response.fold((l) {
      emit(AddTaskFailureState(l.message));
    }, (r) {
      addtaskModel = AddTaskModel.fromJson(r);
      if (addtaskModel!.success == true) {
        log(addtaskModel!.message.toString());
        emit(AddTaskSuccessState(addtaskModel!));
      } else {
        emit(AddTaskFailureState('ther is error in add task'));
      }
    });
  }

  void changeDate(context) async {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
      builder: (context, child) {
        return isDarkMode
            ? Theme(
                data: ThemeData.dark().copyWith(
                    colorScheme: ColorScheme.dark(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.black, // Header text color
                  surface: Theme.of(context)
                      .scaffoldBackgroundColor, // Dialog background color
                  onSurface: Colors.white,
                )),
                child: child!,
              )
            : Theme(
                data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light().copyWith(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white, // Header text color
                  onSurface: Colors.black,
                )),
                child: child!,
              );
      },
    );
    if (dateTime != null) {
      final time =
          '${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
      dateController.text = time;
    }
  }

  void selectRole(index) {
    selectedRole = [2, 4, 3][index ?? 0];
    log(selectedRole.toString());
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
