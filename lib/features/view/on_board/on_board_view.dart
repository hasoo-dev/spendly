import 'package:flutter/material.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FittedBox(
          child: const Text("OnBoardView",style: TextStyle(
            fontFamily: 'Lufga'
          ),),
        ),
      ),
    );
  }
}
