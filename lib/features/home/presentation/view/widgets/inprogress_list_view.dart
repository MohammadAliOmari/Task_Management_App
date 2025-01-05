import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/styles/text_style.dart';

class InProgressListView extends StatelessWidget {
  const InProgressListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Youtube ',
                              style: Styles.textStyle12meduim
                                  .copyWith(color: kGrayColor)),
                          Text('Fortnite Game Video',
                              style: Styles.textStyle14meduim.copyWith(
                                  color: Theme.of(context).primaryColor)),
                          Text('3 min ago',
                              style: Styles.textStyle12meduim
                                  .copyWith(color: kGrayColor)),
                        ],
                      ),
                      CircularPercentIndicator(
                        radius: 20.0,
                        lineWidth: 4.0,
                        percent: 0.8,
                        center: Text(
                          "80%",
                          style: Styles.textStyle12meduim
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        backgroundColor: kLightGrayColor,
                        progressColor: kPurpleColor,
                      ),
                    ],
                  ),
                ),
              ),
          itemCount: 4),
    );
  }
}
