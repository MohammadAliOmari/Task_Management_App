import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/core/widgets/snack_bar.dart';
import 'package:task_app/features/add_task/presentation/manager/add_task_cubit.dart';
import 'package:toastification/toastification.dart';

class AddTaskBlocListener extends StatelessWidget {
  const AddTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskCubit, AddTaskState>(
      listenWhen: (previous, current) =>
          current is AddTaskLoadingState ||
          current is AddTaskSuccessState ||
          current is AddTaskFailureState,
      listener: (context, state) {
        if (state is AddTaskLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          );
        } else if (state is AddTaskSuccessState) {
          GoRouter.of(context).pop();
          snackBar(
              context: context,
              state: state,
              type: ToastificationType.success,
              message:
                  'aassigned to ${state.addTaskModel.usercount}  ${state.addTaskModel.roleName}',
              title: state.addTaskModel.message ?? '',
              color: Colors.green,
              backgroundColor: Colors.green,
              icon: const Icon(Icons.check),
              autoCloseDuration: const Duration(seconds: 2),
              textcolor: Colors.white);
          GoRouter.of(context).go(AppRouter.kHome);
        } else if (state is AddTaskFailureState) {
          GoRouter.of(context).pop();
          snackBar(
              context: context,
              state: state,
              type: ToastificationType.error,
              message: state.message,
              title: 'AddTask Failed',
              color: Colors.red,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.error),
              autoCloseDuration: const Duration(seconds: 2),
              textcolor: Colors.white);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
