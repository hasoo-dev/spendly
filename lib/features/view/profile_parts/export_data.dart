import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportData extends StatefulWidget {
  const ExportData({super.key});

  @override
  State<ExportData> createState() => _ExportDataState();
}

class _ExportDataState extends State<ExportData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onTap: () =>  Get.back(),
        ),
         
      ),
      body: SafeArea(
        child: Column(
          children: [
             
          ],
        ),
      ),
    );
  }
}