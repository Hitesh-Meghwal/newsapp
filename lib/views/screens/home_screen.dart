import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/models/response/article_model.dart';
import 'package:newsapp/utils/strings/app_strings.dart';
import 'package:newsapp/views/widgets/custom_appbar.dart';
import 'package:newsapp/views/widgets/custom_trendingList.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Access the CategoryController via Get.find()
  final HomeController homeController = Get.find();

  @override
  void initState() {
    homeController.getCategory();
    homeController.getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarTitle: AppStrings.news),
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
                      Text(AppStrings.seeAll,
                          style: Theme.of(context).textTheme.bodyMedium)
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
                      Text(AppStrings.seeAll,
                          style: Theme.of(context).textTheme.bodyMedium)
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
      onTap: () {},
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
    return CarouselSlider.builder(
      itemCount: homeController.sliderList.length,
      itemBuilder: (context, index, realIndex) {
        final slider = homeController.sliderList[index];
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                slider.image.toString(),
                width: Get.width,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
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
                  slider.name.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
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
  }

  // indicator
  Widget _buildIndicator() {
    return Obx(() {
      return AnimatedSmoothIndicator(
        activeIndex: homeController.activeIndex.value,
        count: homeController.sliderList.length,
        effect: const SwapEffect(
            activeDotColor: Colors.blue, dotWidth: 10, dotHeight: 10),
      );
    });
  }

  Widget _buildTrendingList() {
    return SizedBox(
        height: 600, // Set a specific height for the list
        width: Get.width * 0.95,
        child: FutureBuilder(
            future: homeController.getNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                      color: Colors.blue, size: 50),
                );
              return ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: homeController.articles.length,
                itemBuilder: (context, index) {
                  final article = homeController.articles[index];
                  return CustomTrendinglist(article: article);
                },
              );
            }));
  }
}
