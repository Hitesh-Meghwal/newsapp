import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/utils/strings/app_strings.dart';
import 'package:newsapp/views/widgets/custom_appbar.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarTitle: AppStrings.news),
      body: _buildCategoryList(),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      margin: EdgeInsets.only(left: Get.width * 0.04, top: Get.height * 0.02),
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
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image.toString(),
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 60,
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
    );
  }
}
