import 'package:flutter/material.dart';
import 'package:saypay/services/auth_services.dart/auth_services.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: InkWell(
          onTap: () {
            authService.logout(context);
          },
          child: Text('Profile '),
        ),
      ),
    );
  }
}
