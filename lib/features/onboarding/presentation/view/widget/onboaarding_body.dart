import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:task_app/features/onboarding/presentation/view/widget/custome_shape.dart';
import 'package:task_app/features/onboarding/presentation/view/widget/onboarding_item.dart';
import 'dart:ui' as ui;

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({
    super.key,
  });

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController pageController = PageController();
  bool isLast = false;
  @override
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        PageView.builder(
          onPageChanged: (int index) {
            if (index == onBoardingPage.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
          },
          controller: pageController,
          itemCount: onBoardingPage.length,
          itemBuilder: (context, index) {
            return onBoardingItem(
              context,
              onBoardingPage[index],
              index,
            );
          },
        ),
        Positioned(
          top: 630.h,
          child: Padding(
            padding: EdgeInsets.only(left: 30.w), // Adjust as needed
            child: SmoothPageIndicator(
              controller: pageController,
              count: onBoardingPage.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotHeight: 8.h,
                dotWidth: 8.w,
                activeDotColor: Theme.of(context).iconTheme.color!,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 10.w),
              child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.kLogin);
                  },
                  child: Text(
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                    ),
                    'Skip',
                  )),
            ),
            GestureDetector(
                onTap: () {
                  isLast
                      ? GoRouter.of(context).go(AppRouter.kLogin)
                      : pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut);
                },
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(
                          129,
                          (129 * 1.4464285714285714)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(context),
                    ),
                    Positioned(
                      top: 101.h,
                      right: 51.w,
                      left: 62.w,
                      bottom: 77.h,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ],
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
