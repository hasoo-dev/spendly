import 'package:flutter/material.dart';
import 'package:saypay/core/theme/app_theme.dart';
import 'package:saypay/features/view/splash/splash_view.dart';

class SayPay extends StatelessWidget {
  const SayPay({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    // ignore: deprecated_member_use
    useInheritedMediaQuery: true,
    // locale: DevicePreview.locale(context),
    // builder: DevicePreview.appBuilder,
    title: "SayPay",

    themeMode: ThemeMode.light,
    darkTheme: ThemeData.dark(),
    theme: AppTheme.lightTheme,
    
    home: SplashView(),

    );
  }
}
