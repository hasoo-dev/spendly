import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:saypay/core/const/app_constant.dart';
 

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // @override
  // void initState() {
  //   super.initState();
  //   _navigateToOnBoard();
  // }

  // void _navigateToOnBoard() async {
  //   await Future.delayed(const Duration(seconds: 2), () {
  //     if (mounted) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const OnBoardView()),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final view = View.of(context).display.size;
    final size = view.height;
    final width = view.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 140, 160, 205),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Positioned.fill(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       gradient: RadialGradient(
          //         colors: [
          //           Colors.lightBlueAccent,
          //           Colors.white,
          //           Colors.lightBlueAccent

          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    AppConstant.logo,
                    height:  size *0.4,
                    width: width/1,
                  ),
                ),
                Text("Say Pay", style: TextStyle(fontSize: 25)),
              ],
            ),
          ).zoomIn(
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
          ),
        ],
      ),
    );
  }
}
