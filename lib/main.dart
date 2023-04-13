import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/app/shared/views/dashboard.dart';
import 'package:tech_task/core/setups/setups.dart';

void main() async {
  await Setups.run();
  runApp(
    ProviderScope(
      child: RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assessment',
      home: Dashboard(DateTime.now()),
    );
  }
}
