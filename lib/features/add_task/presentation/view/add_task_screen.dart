import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/dependency_injection/dependency_injection.dart';
import 'package:task_app/core/utils/styles/text_style.dart';
import 'package:task_app/features/add_task/presentation/manager/add_task_cubit.dart';
import 'package:task_app/features/add_task/presentation/view/widgets/add_task_bloc_builder.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddTaskCubit>(),
      child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            leadingWidth: 65,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text(
              'Add Task',
              style: Styles.textStyle18meduim
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            leading: Padding(
              padding:
                  const EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: kLightGrayColor,
                  ),
                ),
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                ),
              ),
            ),
          ),
          body: const AddTaskBlocBuilder()),
    );
  }
}
