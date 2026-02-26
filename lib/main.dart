import 'package:flutter/material.dart';
import 'package:saypay/app/say_pay.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // runApp(const SayPay());
  runApp(
    DevicePreview(
    enabled: true,
    
    builder: (context) => const SayPay(),
  )
  );
}
