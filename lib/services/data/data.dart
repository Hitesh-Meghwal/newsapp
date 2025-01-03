import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/response/slider_model.dart';
import 'package:newsapp/res/images/app_images.dart';
import 'package:newsapp/utils/strings/app_strings.dart';

class Data {
  List<CategoryModel> getCategory() {
    List<Map<String, String>> categoryData = [
      {'categoryName': AppStrings.business, 'image': AppImages.business},
      {
        'categoryName': AppStrings.entertainment,
        'image': AppImages.entertainment
      },
      {'categoryName': AppStrings.general, 'image': AppImages.general},
      {'categoryName': AppStrings.health, 'image': AppImages.health},
      {'categoryName': AppStrings.sports, 'image': AppImages.sports},
    ];

    // Convert map data to CategoryModel objects
    List<CategoryModel> categoryList = categoryData
        .map((category) => CategoryModel(
            categoryName: category['categoryName'], image: category['image']))
        .toList();
    return categoryList;
  }
}
