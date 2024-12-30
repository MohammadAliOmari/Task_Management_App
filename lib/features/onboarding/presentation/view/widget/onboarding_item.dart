import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/styles/text_style.dart';
import 'package:task_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:task_app/features/onboarding/presentation/view/widget/text_span.dart';

List<String> st = [
  'space',
  'Structured',
  'Tasks',
];
Widget onBoardingItem(
  BuildContext context, [
  OnBoardingModel? onBoarding,
  int i = 0,
]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
        image: AssetImage(onBoarding!.image),
        height: 434,
      ),
      const SizedBox(
        height: 24,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Management',
              style: Styles.textStyle18meduim.copyWith(color: kPurpleColor),
            ),
            RichText(
              text: TextSpan(
                style:
                    Theme.of(context).textTheme.headlineMedium, // Default style
                children: buildTextSpans(onBoarding.description, st[i]),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
