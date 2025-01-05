import 'package:go_router/go_router.dart';
import 'package:task_app/features/add_task/presentation/view/add_task_screen.dart';
import 'package:task_app/features/layout/presentation/view/layout_screen.dart';
import 'package:task_app/features/login/presentation/view/login_screen.dart';
import 'package:task_app/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:task_app/features/signup/presentation/view/sing_up_screen.dart';

abstract class AppRouter {
  static const kLogin = '/loginScreen';
  static const kSingup = '/signupScreeen';
  static const kHome = '/homeScreen';
  static const kAddTask = '/addtaskscreen';
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: kLogin,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: kSingup,
      builder: (context, state) => const SingUpScreen(),
    ),
    GoRoute(
      path: kHome,
      builder: (context, state) => const LayoutScreen(),
    ),
    GoRoute(
      path: kAddTask,
      builder: (context, state) => const AddTaskScreen(),
    ),
  ]);
}
