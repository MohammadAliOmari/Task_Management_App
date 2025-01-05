import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:task_app/core/utils/styles/text_style.dart';
import 'package:task_app/features/home/presentation/view/widgets/app_bar_action_button.dart';
import 'package:task_app/features/home/presentation/view/widgets/app_bar_leading_button.dart';
import 'package:task_app/features/home/presentation/view/widgets/category_list_view.dart';
import 'package:task_app/features/home/presentation/view/widgets/inprogress_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String time = DateFormat('EEEE, d').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 65,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          time,
          style: Styles.textStyle18meduim
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        actions: const [
          ActionButton(),
        ],
        leading: const LeadingButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset('assets/images/Ellipse.png'),
              SizedBox(
                width: 300,
                child: Text(
                  'Let’s make a\nhabits together  🙌',
                  style: Styles.textStyle25semibold
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const CategoryListView(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('In Progress',
                        style: Styles.textStyle18semibold
                            .copyWith(color: Theme.of(context).primaryColor)),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const InProgressListView(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}