import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(20))),
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(
              24,
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
                const SizedBox(
                  height: 16,
                ),
                const BottomSheetItem(
                  title: 'Create Team',
                  icon: Icon(Icons.group_add_outlined),
                ),
                const SizedBox(
                  height: 16,
                ),
                const BottomSheetItem(
                  title: 'Create Project',
                  icon: Icon(Icons.add_chart_outlined),
                ),
                const SizedBox(
                  height: 16,
                ),
                const BottomSheetItem(
                  title: 'Create Meeting',
                  icon: Icon(Icons.meeting_room_outlined),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
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
