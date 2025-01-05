import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/services/internetConnectivity/checkInternet_service.dart';
import 'package:newsapp/utils/strings/app_strings.dart';
import 'package:newsapp/views/widgets/custom_appbar.dart';
import 'package:newsapp/views/widgets/custom_toast.dart';
import 'package:newsapp/views/widgets/custom_trendingList.dart';

class BreakingnewsScreen extends StatefulWidget {
  const BreakingnewsScreen({super.key});

  @override
  State<BreakingnewsScreen> createState() => _BreakingnewsScreenState();
}

class _BreakingnewsScreenState extends State<BreakingnewsScreen> {
  final HomeController homeController = Get.find();

  final CheckinternetService _connectivityService = CheckinternetService();
  bool _isConnected = true;

  @override
  void initState() {
    // Listen to connection changes
    _connectivityService.listenToConnectionChanges((isConnected) {
      setState(() {
        _isConnected = isConnected;
      });

      // Show a snackbar if not connected
      if (!isConnected) {
        ToastHelper.showWarning(context, AppStrings.noInternetConnection);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarTitle: AppStrings.breakingNews, mode: false),
      body: _isConnected
          ? FutureBuilder(
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
                      child: CustomTrendinglist(article: slider),
                    );
                  },
                );
              },
            )
          : Center(
              child: Text(
                AppStrings.noInternetConnection,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
    );
  }
}
