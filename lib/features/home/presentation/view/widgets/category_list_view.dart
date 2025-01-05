import 'package:flutter/material.dart';
import 'package:task_app/core/utils/styles/text_style.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            style: Styles.textStyle18semibold.copyWith(color: Colors.white),
          ),
        ),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
