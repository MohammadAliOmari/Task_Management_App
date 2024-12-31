import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/styles/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var time = DateFormat('EEEE, d').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 65,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          time,
          style: Styles.textStyle18meduim.copyWith(color: kDarkBlueColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: kLightGrayColor,
                ),
              ),
              child: IconButton(
                color: Theme.of(context).primaryColor,
                iconSize: 20,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: kLightGrayColor,
              ),
            ),
            child: IconButton(
              color: Theme.of(context).primaryColor,
              iconSize: 20,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.widgets_outlined),
            ),
          ),
        ),
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
          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
                padding: const EdgeInsets.only(left: 23, top: 26),
                margin: const EdgeInsets.only(right: 16),
                width: 260,
                height: 100,
                child: Text(
                  'Youtube Video',
                  style:
                      Styles.textStyle18semibold.copyWith(color: Colors.white),
                ),
              ),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
            ),
          ),
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
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              border: Border.all(color: kLightGrayColor),
                            ),
                            margin: const EdgeInsets.only(bottom: 16),
                            height: 85,
                            width: 330,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Youtube ',
                                          style: Styles.textStyle12meduim
                                              .copyWith(color: kGrayColor)),
                                      Text('Fortnite Game Video',
                                          style: Styles.textStyle14meduim
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                      Text('3 min ago',
                                          style: Styles.textStyle12meduim
                                              .copyWith(color: kGrayColor)),
                                    ],
                                  ),
                                  CircularPercentIndicator(
                                    radius: 20.0,
                                    lineWidth: 4.0,
                                    percent: 0.8,
                                    center: const Text("80%"),
                                    backgroundColor: kLightGrayColor,
                                    progressColor: kPurpleColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      itemCount: 4),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
