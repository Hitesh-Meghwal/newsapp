import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/response/article_model.dart';
import 'package:newsapp/services/apiService/api_service.dart';
import 'package:newsapp/services/data/data.dart';
import 'package:newsapp/utils/appConstant/app_constant.dart';
import 'package:newsapp/utils/routes/app_Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List<CategoryModel> _categories = [];
  final RxInt _activeIndex = 0.obs;
  final RxBool isLogin = false.obs;
  final RxString _errorMsg = "".obs;
  final RxList<ArticleModel> _articles = RxList<ArticleModel>();
  final RxList<ArticleModel> _sliderList = RxList<ArticleModel>();
  final RxList<CategoryModel> _categoryList = RxList<CategoryModel>();
  final RxList<ArticleModel> _showCategory = RxList<ArticleModel>();

  List<CategoryModel> get categories => _categories;

  RxInt get activeIndex => _activeIndex;
  RxString get errorMsg => _errorMsg;
  RxList<ArticleModel> get articles => _articles;
  RxList<ArticleModel> get sliderList => _sliderList;
  RxList<CategoryModel> get categoryList => _categoryList;
  RxList<ArticleModel> get showCategory => _showCategory;

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
      final getTrendingNews = AppConstant.getTrendingNews();
      final response = await _apiservice.get(url: getTrendingNews);
      if (response != null) {
        // Filter and map the articles
        setUserLogin(true);
        _articles.value = (response.articles as List)
            .where((article) => article['title'] != "[Removed]")
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        _errorMsg.value = "Failed to fetch news";
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
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        _errorMsg.value = "Failed to fetch news";
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
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        _errorMsg.value = "Failed to fetch news";
        loggger.e("Failed to fetch news");
      }
    } catch (e) {
      loggger.e("Error: $e");
    }
  }

  // Read the isLogin value reactively
  void checkUserEnter() async {
    final pref = await SharedPreferences.getInstance();
    final userLogin = pref.getBool("isLogin") ?? false;

    // Update the reactive state
    isLogin.value = userLogin;

    // Log the value to debug
    loggger.i("User login status: ${isLogin.value}");

    // Navigate based on the login status
    if (isLogin.value) {
      Get.offAllNamed(AppRoutes.homeScreen);
    } else {
      Get.offAllNamed(AppRoutes.landingScreen);
    }
  }

  // Store user login status in SharedPreferences
  Future<void> setUserLogin(bool isLoggedIn) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", isLoggedIn);

    // Update the reactive state
    isLogin.value = isLoggedIn;
    loggger.i("User login set to: $isLoggedIn");
  }
}
