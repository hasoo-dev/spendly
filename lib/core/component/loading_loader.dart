import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../const/app_constant.dart';

class LoadingLoader extends StatelessWidget {
  const LoadingLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dims the entire screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppConstant.loading, height: 220, width: 220,),
            const SizedBox(height: 2),
            Text(
              "Loading you in...",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black.withValues(alpha: 0.34),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
