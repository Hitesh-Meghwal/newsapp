import 'package:get/get.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/services/data/data.dart';

class HomeController extends GetxController {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  void getCategory() {
    _categories = Data().getCategory();
  }
}
