import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/styles/text_style.dart';
import 'package:task_app/features/home/data/models/get_task_model.dart';
import 'package:task_app/features/home/presentation/manager/cubit/home_cubit.dart';

class InProgressListView extends StatelessWidget {
  const InProgressListView({
    super.key,
  });

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = context.read<HomeCubit>();
      var task = cubit.getTaskModel;
      if (state is HomeLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).indicatorColor,
          ),
        );
      } else if (state is HomeFailureState) {
        return Center(
          child: Text(
            state.message,
            style: Styles.textStyle16meduim,
          ),
        );
      } else {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 16.h),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(color: kGrayColor),
                  ),
                  margin: EdgeInsets.only(bottom: 16.h),
                  height: 85.h,
                  width: 330.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.data[index].title!,
                                style: Styles.textStyle12meduim
                                    .copyWith(color: kGrayColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1),
                            SizedBox(
                              width: 250.w,
                              child: Text(task.data[index].description!,
                                  style: Styles.textStyle14meduim.copyWith(
                                      color: Theme.of(context).primaryColor),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                            ),
                            Text(timeAgo(task.data[index].updatedAt!),
                                style: Styles.textStyle12meduim
                                    .copyWith(color: kGrayColor)),
                          ],
                        ),
                        CircularPercentIndicator(
                          radius: 20.0.w,
                          lineWidth: 4.0.w,
                          percent: 60 / 100,
                          center: Text(
                            "60%",
                            style: Styles.textStyle12meduim.copyWith(
                                color: Theme.of(context).primaryColor),
                          ),
                          backgroundColor: kLightGrayColor,
                          progressColor: Theme.of(context).iconTheme.color,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: task.data.length),
        );
      }
    });
  }
}
