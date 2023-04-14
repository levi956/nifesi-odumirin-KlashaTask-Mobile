import 'package:flutter/material.dart';
import 'package:tech_task/core/config/device/device_potrait.dart';

class Setups {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    SetPotrait.init();
  }
}

class Environment {
  static String _baseUrl =
      'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev';

  static String get baseUrl => _baseUrl;
}
