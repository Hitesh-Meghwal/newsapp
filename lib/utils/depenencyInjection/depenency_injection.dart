import 'package:get/get.dart';
import 'package:newsapp/controllers/home_controller.dart';

class DepenencyInjection {
  static void init() {
    // Initialize all your controllers and services
    Get.put(HomeController());
  }
}
