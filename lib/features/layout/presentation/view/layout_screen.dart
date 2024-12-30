import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/layout/presentation/manager/cubit/layout_cubit.dart';
import 'package:task_app/features/layout/presentation/view/widgets/layout_bloc_consumer.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  // Current index for BottomNavigationBar
  @override
  Widget build(BuildContext context) {
    // List of pages corresponding to each BottomNavigationBar item

    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: const LayoutBlocConsumer(),
    );
  }
}


// E