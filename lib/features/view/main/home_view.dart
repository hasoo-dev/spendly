import 'package:flutter/material.dart';
import 'package:saypay/core/const/app_constant.dart';
import 'package:saypay/core/utils/size_extension/size_ext.dart';
import 'package:saypay/services/auth_services.dart/auth_services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final authservices = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            0.002.vSpace,
            Image.asset(AppConstant.logo, height: 0.09.h),
            0.002.hSpace,
            Text("Welcome to Spendly $authservices"),
          ],
        ),
      ),
    );
  }
}
