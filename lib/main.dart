import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task_app/bloc_observal.dart';
import 'package:task_app/core/dependency_injection/dependency_injection.dart';
import 'package:task_app/core/utils/app_router.dart';
import 'package:task_app/core/utils/themes/dark_theme.dart';
import 'package:task_app/core/utils/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await dotenv.load();
  getItSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
