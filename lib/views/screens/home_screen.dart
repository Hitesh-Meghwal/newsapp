import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/services/internetConnectivity/checkInternet_service.dart';
import 'package:newsapp/utils/routes/app_Routes.dart';
import 'package:newsapp/utils/strings/app_strings.dart';
import 'package:newsapp/views/widgets/custom_appbar.dart';
import 'package:newsapp/views/widgets/custom_toast.dart';
import 'package:newsapp/views/widgets/custom_trendingList.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Access the CategoryController
  final HomeController homeController = Get.find();
  final CheckinternetService _connectivityService = CheckinternetService();
  bool _isConnected = true;

  @override
  void initState() {
    homeController.getCategory();
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
      appBar: CustomAppbar(appbarTitle: AppStrings.news),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildCategoryList(),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.breakingNews,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.breakingNewsScreen);
                        },
                        child: Text(AppStrings.seeAll,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.blue)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                _buildCarouselSlider(),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                _buildIndicator(),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.trendingNews,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.articleListScreen);
                        },
                        child: Text(AppStrings.seeAll,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.blue)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            _buildTrendingList()
          ],
        ),
      ),
    );
  }

  // categorylist
  Widget _buildCategoryList() {
    return Container(
      margin: EdgeInsets.only(left: Get.width * 0.04, top: Get.height * 0.02),
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: homeController.categories.length,
          itemBuilder: (context, index) {
            final categoryName = homeController.categories[index].categoryName;
            final image = homeController.categories[index].image;
            return _buildCategoryTile(context, categoryName, image);
          }),
    );
  }

  Widget _buildCategoryTile(
      BuildContext context, String? categoryName, String? image) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.categoryScreen, arguments: {
          'appbarTitle': categoryName,
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image.toString(),
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black45,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  categoryName.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Carousel slider widget
  Widget _buildCarouselSlider() {
    return _isConnected
        ? FutureBuilder(
            future: homeController.getBreakingNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                      color: Colors.blue, size: 50),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${homeController.errorMsg.value}'));
              }
              return CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  final slider = homeController.sliderList[index];
                  return GestureDetector(
                    onTap: () {
                      if (slider.url != null && slider.url!.isNotEmpty) {
                        Get.toNamed(AppRoutes.articleScreen,
                            arguments: {'url': slider.url});
                      } else {
                        Get.snackbar(
                          "Invalid Link",
                          "This link is unavailable.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.withOpacity(0.8),
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: slider.urlToImage.toString(),
                              width: Get.width,
                              height: 250,
                              fit: BoxFit.cover,
                            )),
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(top: 130),
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              slider.title.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      homeController.setActiveIndex(index);
                    }),
              );
            })
        : Text(
            AppStrings.noInternetConnection,
            style: Theme.of(context).textTheme.bodyLarge,
          );
  }

  // indicator
  Widget _buildIndicator() {
    return Obx(() {
      final activeIndex = homeController.activeIndex.value;
      final sliderListLength = homeController.sliderList.length;

      // Check for valid values
      if (sliderListLength > 0 &&
          activeIndex.isFinite &&
          activeIndex < sliderListLength) {
        return AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: 5,
          effect: const SwapEffect(
              activeDotColor: Colors.blue, dotWidth: 10, dotHeight: 10),
        );
      } else {
        return const SizedBox();
      }
    });
  }

  Widget _buildTrendingList() {
    return SizedBox(
        height: 600, // Set a specific height for the list
        width: Get.width * 0.95,
        child: _isConnected
            ? FutureBuilder(
                future: homeController.getTrendingNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.blue, size: 50),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${homeController.errorMsg.value}'));
                  }
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: homeController.articles.length,
                    itemBuilder: (context, index) {
                      final article = homeController.articles[index];
                      return CustomTrendinglist(article: article);
                    },
                  );
                })
            : Center(
                child: Text(
                  AppStrings.noInternetConnection,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ));
  }
}
