import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/response/article_model.dart';
import 'package:newsapp/models/response/show_category.dart';
import 'package:newsapp/models/response/slider_model.dart';
import 'package:newsapp/services/apiService/api_service.dart';
import 'package:newsapp/services/data/data.dart';
import 'package:newsapp/utils/appConstant/app_constant.dart';

class HomeController extends GetxController {
  List<CategoryModel> _categories = [];
  final RxInt _activeIndex = 0.obs;
  final RxList<ArticleModel> _articles = RxList<ArticleModel>();
  final RxList<SliderModel> _sliderList = RxList<SliderModel>();
  final RxList<CategoryModel> _categoryList = RxList<CategoryModel>();
  final RxList<ShowCategory> _showCategory = RxList<ShowCategory>();

  List<CategoryModel> get categories => _categories;

  RxInt get activeIndex => _activeIndex;
  RxList<ArticleModel> get articles => _articles;
  RxList<SliderModel> get sliderList => _sliderList;
  RxList<CategoryModel> get categoryList => _categoryList;
  RxList<ShowCategory> get showCategory => _showCategory;

  final Apiservice _apiservice = Apiservice();
  final loggger = Logger();

  void getCategory() {
    _categories = Data().getCategory();
  }

  void setActiveIndex(index) {
    _activeIndex.value = index;
  }

  Future<void> getTrendingNews() async {
    try {
      final response = await _apiservice.get(url: AppConstant.getTrendingNews);
      if (response != null) {
        // Filter and map the articles
        _articles.value = (response.articles as List)
            .where((article) => article['title'] != "[Removed]")
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        loggger.e("Failed to fetch news");
      }
    } catch (e) {
      loggger.e("Error: $e");
    }
  }

  Future<void> getBreakingNews() async {
    try {
      final response = await _apiservice.get(url: AppConstant.getBreakingNews);
      if (response != null) {
        // Filter and map the articles
        _sliderList.value = (response.articles as List)
            .where((article) => article['title'] != "[Removed]")
            .map((article) => SliderModel.fromJson(article))
            .toList();
      } else {
        loggger.e("Failed to fetch news");
      }
    } catch (e) {
      loggger.e("Error: $e");
    }
  }

  Future<void> getCategoryNews(String? categoryName) async {
    try {
      // Get the category-specific URL
      final url =
          AppConstant.getCategoryNews(categoryName.toString().toLowerCase());
      final response = await _apiservice.get(url: url);
      if (response != null) {
        // Filter and map the articles
        _showCategory.value = (response.articles as List)
            .where((article) => article['title'] != "[Removed]")
            .map((article) => ShowCategory.fromJson(article))
            .toList();
      } else {
        loggger.e("Failed to fetch news");
      }
    } catch (e) {
      loggger.e("Error: $e");
    }
  }
}
