import 'dart:collection';

import 'package:get/get.dart';
import 'package:newsapp/views/screens/articleList_screen.dart';
import 'package:newsapp/views/screens/article_screen.dart';
import 'package:newsapp/views/screens/breakingnews_screen.dart';
import 'package:newsapp/views/screens/category_screen.dart';
import 'package:newsapp/views/screens/home_screen.dart';
import 'package:newsapp/views/screens/landing_screen.dart';
import 'package:newsapp/views/screens/spash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String homeScreen = "/homeScreen";
  static const String landingScreen = "/landingScreen";
  static const String articleScreen = "/articleScreen";
  static const String articleListScreen = "/articleListScreen";
  static const String breakingNewsScreen = "/breakingNewsScreen";
  static const String categoryScreen = "/categoryScreen";

  static final List<GetPage> routes = [
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.leftToRight),
    GetPage(name: splashScreen, page: () => const SpashScreen()),
    GetPage(name: landingScreen, page: () => const LandingScreen()),
    GetPage(name: articleScreen, page: () => const ArticleScreen()),
    GetPage(name: articleListScreen, page: () => ArticlelistScreen()),
    GetPage(name: breakingNewsScreen, page: () => const BreakingnewsScreen()),
    GetPage(name: categoryScreen, page: () => const CategoryScreen())
  ];
}
