import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/navigation/navigator.dart';

class CustomBackButton extends HookConsumerWidget {
  const CustomBackButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => pop(context),
      icon: Icon(Icons.arrow_back),
    );
  }
}
