import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/utils/strings/app_strings.dart';
import 'package:newsapp/views/widgets/custom_appbar.dart';
import 'package:newsapp/views/widgets/custom_trendingList.dart';

class BreakingnewsScreen extends StatelessWidget {
  BreakingnewsScreen({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarTitle: AppStrings.breakingNews,mode: false),
      body: FutureBuilder(
        future: homeController.getBreakingNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.blue,
                size: 50,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: homeController.sliderList.length,
            itemBuilder: (context, index) {
              final slider = homeController.sliderList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: CustomTrendinglist(slider: slider),
              );
            },
          );
        },
      ),
    );
  }
}