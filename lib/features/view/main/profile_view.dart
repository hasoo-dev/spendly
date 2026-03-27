import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saypay/core/utils/size_extension/size_ext.dart';
import 'package:saypay/services/auth_services.dart/auth_services.dart';
import 'package:saypay/services/session_controller/session_controller.dart';

import '../../../core/const/app_constant.dart';
import '../../../core/routes/routes_constant.dart' show RoutesConstant;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // Attempt to get user info from the session
    final user = SessionController.userModel;
    final userName = user?.fullName ?? "Unknown";
    final userEmail = user?.email ?? "sofia@gmail.com";
    final avatarUrl = user?.avatarUrl ?? "";
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor:
          theme.colorScheme.onPrimary, // Light background for contrast
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onPrimary,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 19,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User Avatar
              CircleAvatar(
                radius: 0.07.h,
                backgroundColor: Colors.transparent,
                backgroundImage: avatarUrl.isNotEmpty
                    ? NetworkImage(avatarUrl)
                    : const AssetImage(AppConstant.profile)
                          as ImageProvider,
              ),
              0.01.vSpace,
              // User Name
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              // User Email
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              0.02.vSpace,

              // General Section Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "General",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              0.01.vSpace,

              // Menu Items
              _buildMenuItem(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () {
                  Get.toNamed(RoutesConstant.editProfile);
                },
              ),

              _buildMenuItem(
                icon: Icons.shield_outlined,
                title: "Security",
                onTap: () {},
              ),

              _buildMenuItem(
                icon: Icons.report,
                title: "Report", // Added as requested
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.info_outline,
                title: "About Spendly", // Added as requested
                onTap: () {},
              ),
              // const SizedBox(height: 8),
              0.01.vSpace,
              _buildMenuItem(
                icon: Icons.logout,
                title: "Logout",
                isDestructive: true,
                onTap: () {
                  _authService.logout(context);
                },
              ),
              // Bottom padding to avoid nav bar overlap
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.onPrimary, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red.shade400 : Colors.black87,
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: isDestructive ? Colors.red.shade400 : Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
