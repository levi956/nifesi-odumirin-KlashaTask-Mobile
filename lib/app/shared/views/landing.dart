import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tech_task/app/shared/constants/layout.dart';
import 'package:tech_task/app/shared/widgets/base_text.dart';
import 'package:tech_task/core/config/device/bar_color.dart';

class LandingPage extends HookConsumerWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      body: Padding(
        padding: screenPadding,
        child: ListView(
          children: [
            YBox(50),
            Image.asset('assets/images/chef.png'),
            BaseText(
              text: 'When would you like lunch?',
              size: 23,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
