import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/styles/text_style.dart';
import 'package:task_app/core/widgets/custom_button.dart';
import 'package:task_app/core/widgets/custom_text_field.dart';
import 'package:task_app/features/add_task/presentation/manager/add_task_cubit.dart';
import 'package:task_app/features/add_task/presentation/view/widgets/add_taskk_bloc_listener.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddTaskBlocBuilder extends StatelessWidget {
  const AddTaskBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        var cubit = context.read<AddTaskCubit>();
        return SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Title',
                    style: Styles.textStyle14meduim.copyWith(color: kGrayColor),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hintText: 'Title',
                    controller: cubit.titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Task Description',
                    style: Styles.textStyle14meduim.copyWith(color: kGrayColor),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    controller: cubit.descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text('Task notes',
                      style:
                          Styles.textStyle14meduim.copyWith(color: kGrayColor)),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hintText: 'Notes',
                    controller: cubit.notesController,
                    validator: (value) {},
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text('Task Deadline',
                      style:
                          Styles.textStyle14meduim.copyWith(color: kGrayColor)),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    icon: Icon(
                      FontAwesomeIcons.calendarDays,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onpressed: () {
                      cubit.changeDate(context);
                    },
                    hintText: 'Deadline Date',
                    controller: cubit.dateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter deadline date';
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('Select Role',
                      style:
                          Styles.textStyle14meduim.copyWith(color: kGrayColor)),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: ToggleSwitch(
                      customWidths: const [100, 100, 100],
                      initialLabelIndex: 0,
                      totalSwitches: 3,
                      activeFgColor: Theme.of(context).scaffoldBackgroundColor,
                      inactiveBgColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      activeBgColor: [
                        Theme.of(context).iconTheme.color!,
                        Theme.of(context).iconTheme.color!,
                        Theme.of(context).iconTheme.color!,
                      ],
                      labels: const ['Editor', 'translator', 'reviewer'],
                      onToggle: (index) {
                        cubit.selectRole(index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomButton(
                      title: 'Add Task',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.addTask();
                        }
                      }),
                  const AddTaskBlocListener(),
                  // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
