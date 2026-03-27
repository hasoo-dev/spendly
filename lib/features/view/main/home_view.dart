import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Column(
        mainAxisAlignment: .center,
        children: [
           Center(
            child: Text("Home",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),),
           )
        ],
      ),
    );
  }
}