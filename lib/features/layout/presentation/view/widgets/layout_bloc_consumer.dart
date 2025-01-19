import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/features/layout/presentation/manager/cubit/layout_cubit.dart';

class LayoutBlocConsumer extends StatelessWidget {
  const LayoutBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: context.read<LayoutCubit>().screens[context
              .read<LayoutCubit>()
              .curentindex], // Show the page based on the selected index
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 12,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            currentIndex: context.read<LayoutCubit>().curentindex,
            selectedItemColor: Theme.of(context).iconTheme.color,
            unselectedItemColor: kGrayColor,
            showSelectedLabels: false,
            iconSize: 28.sp,
            onTap: (value) {
              if (value == 2) {
                context.read<LayoutCubit>().showBottomSheet(context);
              } else {
                context.read<LayoutCubit>().changeeNavBar(value);
              }
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                activeIcon: const Icon(Icons.home_rounded),
                icon: const Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                activeIcon: const Icon(Icons.folder),
                icon: const Icon(Icons.folder_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50).w,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  child: const Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                activeIcon: const Icon(Icons.person),
                icon: const Icon(Icons.person_2_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: const Icon(Icons.settings),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
