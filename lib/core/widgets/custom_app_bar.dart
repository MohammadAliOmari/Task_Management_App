import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/styles/text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);
    final canPop = goRouter.canPop();
    return Row(
      children: [
        if (canPop) // Show the back button only if the user can navigate back
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: kGrayColor,
              ),
            ),
            child: IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
              ),
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                if (canPop) {
                  goRouter.pop();
                } else {
                  if (onPressed != null) {
                    onPressed!();
                  }
                }
              },
            ),
          ),
        SizedBox(
          width: canPop ? 91 : 141,
        ),
        Text(
          title,
          style: Styles.textStyle18meduim
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
