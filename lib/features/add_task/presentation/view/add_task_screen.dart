import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/constants.dart';
import 'package:task_app/core/utils/styles/text_style.dart';
import 'package:task_app/core/widgets/custom_button.dart';
import 'package:task_app/core/widgets/custom_text_field.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController dcontroller = TextEditingController();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 65,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            'Add Task',
            style: Styles.textStyle18meduim
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          leading: Padding(
            padding:
                const EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 0),
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
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_sharp),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Title',
                    style: Styles.textStyle14meduim.copyWith(color: kGrayColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'Title',
                    controller: controller,
                    validator: (p0) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Task Description',
                    style: Styles.textStyle14meduim.copyWith(color: kGrayColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    controller: dcontroller,
                    validator: (p0) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Task notes',
                      style:
                          Styles.textStyle14meduim.copyWith(color: kGrayColor)),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: 'Notes',
                    controller: dcontroller,
                    validator: (p0) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Task Deadline',
                      style:
                          Styles.textStyle14meduim.copyWith(color: kGrayColor)),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    icon: Icon(
                      FontAwesomeIcons.calendarDays,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onpressed: () async {
                      final dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(3000),
                        builder: (context, child) {
                          return isDarkMode
                              ? Theme(
                                  data: ThemeData.dark().copyWith(
                                      colorScheme: ColorScheme.dark(
                                    primary: Theme.of(context).primaryColor,
                                    onPrimary:
                                        Colors.white, // Header text color
                                    surface: Colors
                                        .grey[850]!, // Dialog background color
                                    onSurface: Colors.white,
                                  )),
                                  child: child!,
                                )
                              : Theme(
                                  data: ThemeData.light().copyWith(
                                      colorScheme:
                                          const ColorScheme.light().copyWith(
                                    primary: Theme.of(context).primaryColor,
                                    onPrimary:
                                        Colors.white, // Header text color
                                    onSurface: Colors.black,
                                  )),
                                  child: child!,
                                );
                        },
                      );
                      final time =
                          '${dateTime?.day}/${dateTime?.month}/${dateTime?.year}';
                      if (dateTime != null) {
                        dcontroller.text = time;
                      }
                    },
                    hintText: 'Deadline Date',
                    controller: dcontroller,
                    validator: (p0) {},
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CustomButton(title: 'Add Task', onPressed: () {})
                ],
              ),
            ),
          ),
        ));
  }
}
