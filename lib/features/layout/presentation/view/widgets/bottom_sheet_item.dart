import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.icon,
    this.onTap,
    required this.title,
  });
  final Icon icon;
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kGrayColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Row(
          children: [
            icon,
            const SizedBox(
              width: 12,
            ),
            Text(title)
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
