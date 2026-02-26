import 'package:flutter/material.dart';
import 'package:saypay/core/routes/routes_constant.dart';
 
import '../../features/view/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Splash
      case RoutesConstant.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
//OnBoard
      case RoutesConstant.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OnBoardView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
