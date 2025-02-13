import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/features/home/presentation/view/home_screen.dart';
import 'package:task_app/features/layout/presentation/view/widgets/bottom_sheet_item.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutCubitState> {
  LayoutCubit() : super(LayoutCubitInitial());
  int curentindex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void changeeNavBar(int index) {
    curentindex = index;
    emit(LayoutCubitChangeNavBar());
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      showDragHandle: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) => Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(20.r))),
          height: 400.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 24.h,
            ),
            child: Column(
              children: [
                BottomSheetItem(
                  title: 'Create Task',
                  icon: const Icon(Icons.add_task_outlined),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kAddTask);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                const BottomSheetItem(
                  title: 'Create Team',
                  icon: Icon(Icons.group_add_outlined),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const BottomSheetItem(
                  title: 'Create Project',
                  icon: Icon(Icons.add_chart_outlined),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const BottomSheetItem(
                  title: 'Create Meeting',
                  icon: Icon(Icons.meeting_room_outlined),
                ),
                const Spacer(),
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50).r,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
    );
    emit(LayoutCubitShowBottomSheet());
  }
}
