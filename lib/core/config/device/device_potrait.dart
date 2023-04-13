import 'package:flutter/services.dart';

class SetPotrait {
  static void init() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }
}
