import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/res/images/app_images.dart';
import 'package:newsapp/utils/routes/app_Routes.dart';
import 'package:newsapp/views/widgets/custom_appbar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final HomeController homeController = Get.find();
  final String? appbarTitle = Get.arguments['appbarTitle'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarTitle: appbarTitle ?? "Category"),
      body: FutureBuilder(
        future: homeController.getCategoryNews(appbarTitle),
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
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: homeController.showCategory.length,
            itemBuilder: (context, index) {
              final category = homeController.showCategory[index];
              return _buildshowCategory(
                category.urlToImage,
                category.title,
                category.decsription,
                category.url,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildshowCategory(
      String? imageUrl, String? title, String? description, String? url) {
    return GestureDetector(
      onTap: () {
        if (url != null && url.isNotEmpty) {
          Get.toNamed(AppRoutes.articleScreen, arguments: {'url': url});
        } else {
          Get.snackbar(
            "Invalid Article",
            "This article link is unavailable.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.8),
            colorText: Colors.white,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageUrl != null && imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: Get.width,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppImages.general,
                        width: Get.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      AppImages.general,
                      width: Get.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              title ?? "No Title Available",
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description ?? "No description available.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
