import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/res/images/app_images.dart';
import 'package:newsapp/utils/routes/app_Routes.dart';
import 'package:newsapp/utils/strings/app_strings.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildShowImage(context),
          Positioned(
            bottom: 40.0,
            left: 20.0,
            right: 20.0,
            child: _buildStartButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildShowImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(AppImages.news,
                width: Get.width, height: Get.height / 1.8, fit: BoxFit.cover),
          ),
          const SizedBox(height: 40.0),
          Text(
            AppStrings.landingText1,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15.0),
          Text(
            AppStrings.landingText2,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      height: 56.0,
      child: ElevatedButton(
        onPressed: () {
          Get.offNamed(AppRoutes.homeScreen);
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue.shade400),
            elevation: const WidgetStatePropertyAll(5.0)),
        child: Text(
          AppStrings.exploreNews,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
