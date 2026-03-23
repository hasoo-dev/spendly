import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saypay/app/spendly.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Spendly());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const Spendly(),
  //   ),
  // );
}
