import 'package:get/get.dart';
import 'package:newsapp/views/screens/article_screen.dart';
import 'package:newsapp/views/screens/home_screen.dart';
import 'package:newsapp/views/screens/landing_screen.dart';

class AppRoutes {
  static const String homeScreen = "/homeScreen";
  static const String landingScreen = "/landingScreen";
  static const String articleScreen = "/articleScreen";

  static final List<GetPage> routes = [
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.leftToRight),
    GetPage(name: landingScreen, page: () => const LandingScreen()),
    GetPage(name: articleScreen, page: () => ArticleScreen())
  ];
}
