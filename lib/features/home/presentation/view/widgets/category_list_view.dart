import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/utils/styles/text_style.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16).w,
            color: Colors.red,
          ),
          padding: EdgeInsets.only(left: 23.w, top: 26.h),
          margin: EdgeInsets.only(right: 16.w),
          width: 260.w,
          height: 100.h,
          child: Text(
            'Youtube Video',
            style: Styles.textStyle18semibold.copyWith(color: Colors.white),
          ),
        ),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
