import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/home_controller.dart';
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
  void initState() {
    super.initState();
    homeController.getCategoryNews(appbarTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(appbarTitle: appbarTitle.toString()),
        body: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: homeController.showCategory.length,
            itemBuilder: (context, index) {
              return _buildshowCategory(
                homeController.showCategory[index].urlToImage,
                homeController.showCategory[index].title,
                homeController.showCategory[index].decsription,
                homeController.showCategory[index].url,
              );
            }));
  }

  Widget _buildshowCategory(
      String? imageUrl, String? title, String? description, String? url) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.articleScreen, arguments: {'url': url});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrl.toString(),
                  width: Get.width,
                  height: 200,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(title.toString(),
                style: Theme.of(context).textTheme.bodyLarge, maxLines: 2),
            Text(description.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
                maxLines: 3)
          ],
        ),
      ),
    );
  }
}
