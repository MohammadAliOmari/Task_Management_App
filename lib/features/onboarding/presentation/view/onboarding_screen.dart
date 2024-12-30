import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:task_app/features/onboarding/presentation/view/widget/onboaarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: const SafeArea(
        child: Scaffold(
          body: OnBoardingBody(),
        ),
      ),
    );
  }
}
