// import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:saypay/core/routes/routes_constant.dart';
import '../../features/view/view.dart';

class AppRoutes {
  static final routes = [
    // Splash
    GetPage(
      name: RoutesConstant.splash,
      page: () => const SplashView(),
      transition: Transition.fadeIn, // Smooth entry for splash
    ),

    // Onboarding
    GetPage(
      name: RoutesConstant.onBoard,
      page: () => const OnBoardView(),
    ),

    // Auth / Login
    GetPage(
      name: RoutesConstant.login,
      page: () => const AuthView(),
      transition: Transition.rightToLeftWithFade,
    ),

    // Forget Password
    GetPage(
      name: RoutesConstant.forgetPassword,
      page: () => const ForgetPasswordView(),
    ),

    // Main Dashboard
    GetPage(
      name: RoutesConstant.main,
      page: () => const MainView(),
      transition: Transition.zoom, // Nice pop-in effect for the main app
    ),

    GetPage(
      name: RoutesConstant.editProfile,
      page: () => const EditProfileView(),
    ),
    GetPage(
      name: RoutesConstant.changePassword,
      page: () => const ChangePasswordView(),
    ),
    GetPage(
      name: RoutesConstant.theme,
      page: () => const ThemeToogle(),
    ),
    GetPage(
      name: RoutesConstant.currency,
      page: () => const Currency(),
    ),
    GetPage(
      name: RoutesConstant.exportData,
      page: () => const ExportData(),
    ),
    GetPage(
      name: RoutesConstant.backup,
      page: () => const Backup(),
    ),
    GetPage(
      name: RoutesConstant.aboutSpendly,
      page: () => const AboutSpendly(),
    ),
    
  ];
}