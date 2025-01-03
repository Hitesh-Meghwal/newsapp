import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/res/colors/app_colors.dart';
import 'package:newsapp/res/images/app_images.dart';

class CustomTrendinglist extends StatelessWidget {
  const CustomTrendinglist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: AppColors.primaryColor,
        elevation: 3.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppImages.entertainment,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Column(
              children: [
                Container(
                  width: Get.width / 1.7,
                  child: Text(
                      "Hellik snfknf snfkin snfk sgfssfffggfhththfghfghgh feffe fff f sae ",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                Container(
                  width: Get.width / 1.7,
                  child: Text("Hellik snfknf snfkin snfk",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
