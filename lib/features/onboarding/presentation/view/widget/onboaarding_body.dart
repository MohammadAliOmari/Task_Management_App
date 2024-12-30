import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:task_app/features/onboarding/presentation/view/widget/onboarding_item.dart';

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
          top: 630,
          child: Padding(
            padding: const EdgeInsets.only(left: 30), // Adjust as needed
            child: SmoothPageIndicator(
              controller: pageController,
              count: onBoardingPage.length,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: kPurpleColor,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
              child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.kLogin);
                  },
                  child: const Text(
                    style: TextStyle(
                      color: kPurpleColor,
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
              child: Image.asset(
                'assets/images/next_button.png',
                height: 190,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
