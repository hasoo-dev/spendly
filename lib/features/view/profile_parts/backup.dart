import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Backup extends StatefulWidget {
  const Backup({super.key});

  @override
  State<Backup> createState() => _BackupState();
}

class _BackupState extends State<Backup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onTap: () => Get.back(),
        ),
      ),
      body: SafeArea(child: Column(children: [
             
          ],
        )),
    );
  }
}
