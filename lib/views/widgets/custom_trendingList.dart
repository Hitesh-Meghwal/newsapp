import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/response/article_model.dart';
import 'package:newsapp/res/colors/app_colors.dart';
import 'package:newsapp/res/images/app_images.dart';

class CustomTrendinglist extends StatelessWidget {
  ArticleModel? article;
  CustomTrendinglist({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          
        },
        child: Card(
          color: AppColors.primaryColor,
          elevation: 3.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: article!.urlToImage != null
                      ? CachedNetworkImage(
                          imageUrl: article!.urlToImage ?? AppImages.general,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          AppImages.general,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                children: [
                  SizedBox(
                    width: Get.width / 1.7,
                    child: Text(article!.title.toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  SizedBox(
                    width: Get.width / 1.7,
                    child: Text(
                      article!.decsription.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                      maxLines: 3,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
