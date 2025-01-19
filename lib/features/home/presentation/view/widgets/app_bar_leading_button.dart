import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/constants.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, top: 8.h, bottom: 8.h, right: 0),
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50).w,
          border: Border.all(
            color: kLightGrayColor,
          ),
        ),
        child: IconButton(
          color: Theme.of(context).primaryColor,
          iconSize: 20.sp,
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Icon(Icons.widgets_outlined),
        ),
      ),
    );
  }
}
