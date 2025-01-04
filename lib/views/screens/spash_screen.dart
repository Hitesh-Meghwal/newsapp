import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/res/images/app_images.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  final HomeController homeController = Get.find(); // GetX controller

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(
        const Duration(seconds: 2),
        () {
          // Check login state using GetX's reactive value
          homeController.checkUserEnter();
          homeController.setUserLogin(true);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(AppImages.newsLogo),
    );
  }
}
