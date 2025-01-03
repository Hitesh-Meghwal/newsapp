import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/res/colors/app_colors.dart';
import 'package:newsapp/utils/depenencyInjection/depenency_injection.dart';
import 'package:newsapp/utils/routes/app_Routes.dart';

void main() {
  // Initialize all dependencies
  DepenencyInjection.init();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        brightness: Brightness.light,
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
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            titleTextStyle: Theme.of(context).textTheme.headlineMedium),
      ),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.homeScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
