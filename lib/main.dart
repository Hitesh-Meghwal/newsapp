import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/controllers/theme_controller.dart';
import 'package:newsapp/res/colors/app_colors.dart';
import 'package:newsapp/utils/depenencyInjection/depenency_injection.dart';
import 'package:newsapp/utils/routes/app_Routes.dart';

void main() async {
  // Initialize all dependencies
  DepenencyInjection.init();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return GetMaterialApp(
      title: 'News App',
      defaultTransition: Transition.cupertino,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.light, // Light theme brightness
        ),
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.primaryColor,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
          ),
          headlineMedium: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryColor,
          ),
          bodyLarge: GoogleFonts.roboto(
            fontSize: 16,
            color: AppColors.secondaryColor,
          ),
          bodyMedium: GoogleFonts.roboto(
            fontSize: 14,
            color: AppColors.secondaryColor,
          ),
          bodySmall: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor, // Set background color
          elevation: 0,
          titleTextStyle: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryColor, // Title text color
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark, // Dark theme brightness
        ),
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white70,
          ),
          bodySmall: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Dark app bar background
          elevation: 0,
          titleTextStyle: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Dark mode title text color
          ),
        ),
      ),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.landingScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
