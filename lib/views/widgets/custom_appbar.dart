import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/theme_controller.dart';
import 'package:newsapp/res/images/app_images.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;
  CustomAppbar({super.key, required this.appbarTitle});
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          Text(appbarTitle, style: Theme.of(context).textTheme.headlineMedium),
      leading: Platform.isIOS
          ? IconButton(
              icon: const Icon(Icons.chevron_left_outlined),
              onPressed: () {
                Navigator.pop(context); // Go back when tapped
              },
            )
          : null, // For Android, AppBar will show the back button automatically
      actions: [
        Row(
          children: [
            Obx(
              () => themeController.isDarkMode.value
                  ? SvgPicture.asset(
                      AppImages.moon,
                      color: Colors.amberAccent,
                      width: 20,
                    )
                  : SvgPicture.asset(
                      AppImages.sun,
                      color: Colors.orange,
                      width: 20,
                    ),
            ),
            const SizedBox(width: 5),
            Obx(() => Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.toggleTheme();
                  },
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[300],
                )),
            const SizedBox(width: 16), // Add spacing before the edge
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Define preferred size;
}
