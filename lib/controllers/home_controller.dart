import 'package:get/get.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/services/data/data.dart';

class HomeController extends GetxController {
  List<CategoryModel> _categories = [];
  List<SliderModel> _sliderList = [];
  final RxInt _activeIndex = 0.obs;

  List<CategoryModel> get categories => _categories;
  List<SliderModel> get sliderList => _sliderList;
  RxInt get activeIndex => _activeIndex;

  void getCategory() {
    _categories = Data().getCategory();
  }

  void getSlider() {
    _sliderList = Data().getSliderData();
  }

  void setActiveIndex(index) {
    _activeIndex.value = index;
  }
}
