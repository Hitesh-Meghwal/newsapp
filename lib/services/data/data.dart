import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/slider_model.dart';
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

  List<SliderModel> getSliderData() {
    List<Map<String, String>> sliderData = [
      {'name': AppStrings.business, 'image': AppImages.business},
      {'name': AppStrings.entertainment, 'image': AppImages.entertainment},
      {'name': AppStrings.general, 'image': AppImages.general},
      {'name': AppStrings.health, 'image': AppImages.health},
      {'name': AppStrings.sports, 'image': AppImages.sports},
    ];

    // Convert map data to SliderModel objects
    List<SliderModel> sliderList = sliderData
        .map((slider) =>
            SliderModel(name: slider['name'], image: slider['image']))
        .toList();
    return sliderList;
  }
}
