import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
