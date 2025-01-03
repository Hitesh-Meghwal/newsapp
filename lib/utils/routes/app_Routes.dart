import 'package:get/get.dart';
import 'package:newsapp/views/screens/home_screen.dart';

class AppRoutes {
  static const String homeScreen = "/homeScreen";

  static final List<GetPage> routes = [
    GetPage(name: homeScreen, page: () => const HomeScreen())
  ];
}
