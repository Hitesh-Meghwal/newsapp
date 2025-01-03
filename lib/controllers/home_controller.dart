import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/response/article_model.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/services/apiService/api_service.dart';
import 'package:newsapp/services/data/data.dart';
import 'package:newsapp/utils/appConstant/app_constant.dart';

class HomeController extends GetxController {
  List<CategoryModel> _categories = [];
  List<SliderModel> _sliderList = [];
  final RxInt _activeIndex = 0.obs;
  final RxList<ArticleModel> _articles = RxList<ArticleModel>();
  final RxBool _loading = false.obs;

  List<CategoryModel> get categories => _categories;
  List<SliderModel> get sliderList => _sliderList;
  RxInt get activeIndex => _activeIndex;
  RxList<ArticleModel> get articles => _articles;
  RxBool get loading => _loading;

  final Apiservice _apiservice = Apiservice();
  final loggger = Logger();

  void getCategory() {
    _categories = Data().getCategory();
  }

  void getSlider() {
    _sliderList = Data().getSliderData();
  }

  void setActiveIndex(index) {
    _activeIndex.value = index;
  }

  Future<void> getNews() async {
    try {
      _loading.value = true;
      final response = await _apiservice.get(url: AppConstant.getNews);
      if (response != null) {
        // Filter and map the articles
        _articles.value = (response.articles as List)
            .where((article) =>
                article['title'] != "[Removed]")
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        loggger.e("Failed to fetch news");
      }
      _loading.value = false;
    } catch (e) {
      loggger.e("Error: $e");
      _loading.value = false;
    }
  }
}
