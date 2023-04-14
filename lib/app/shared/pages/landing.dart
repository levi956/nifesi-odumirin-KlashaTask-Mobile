import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/app/shared/constants/layout.dart';
import 'package:tech_task/app/shared/pages/dashboard.dart';
import 'package:tech_task/app/shared/widgets/base_text.dart';
import 'package:tech_task/app/shared/widgets/custom_button.dart';
import 'package:tech_task/app/shared/widgets/date_picker.dart';
import 'package:tech_task/core/config/device/bar_color.dart';
import 'package:tech_task/core/navigation/navigator.dart';

class LandingPage extends HookConsumerWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setStatusBarColor(color: BarColor.black);

    final lunchDate = useState<DateTime>(DateTime.now());

    return Scaffold(
      body: Padding(
        padding: screenPadding,
        child: ListView(
          children: [
            YBox(50),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/chef.png',
                height: 120,
                width: 120,
              ),
            ),
            YBox(10),
            BaseText(
              text: 'When would you like lunch?',
              size: 20,
              weight: FontWeight.w600,
            ),
            YBox(30),
            _dateCard(
              () => datePickerDialog(
                context: context,
                child: CupertinoDatePicker(
                  initialDateTime: lunchDate.value,
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  onDateTimeChanged: (newDate) {
                    lunchDate.value = newDate;
                  },
                ),
              ),
              DateFormat('EEEE d MMMM y').format(lunchDate.value),
            ),
            YBox(30),
            CustomButton(
              text: 'Get Ingredients',
              onPressed: () {
                final page = Dashboard(lunchDate.value);
                pushTo(context, page);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _dateCard(
  VoidCallback onTap,
  String date,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Row(
        children: [
          Icon(
            Icons.date_range_sharp,
          ),
          XBox(10),
          BaseText(text: date),
        ],
      ),
    ),
  );
}
