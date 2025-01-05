import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/response/article_model.dart';
import 'package:newsapp/res/colors/app_colors.dart';
import 'package:newsapp/res/images/app_images.dart';
import 'package:newsapp/utils/routes/app_Routes.dart';

class CustomTrendinglist extends StatelessWidget {
  final ArticleModel? article;

  const CustomTrendinglist({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    // Determine the content source
    final String? imageUrl = article?.urlToImage ;
    final String? title = article?.title;
    final String? description = article?.decsription;
    final String? url = article?.url;

    return GestureDetector(
      onTap: () {
        if (url != null && url.isNotEmpty) {
          Get.toNamed(AppRoutes.articleScreen, arguments: {'url': url});
        } else {
          Get.snackbar(
            "Invalid Link",
            "This link is unavailable.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.8),
            colorText: Colors.white,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          color: AppColors.primaryColor,
          elevation: 3.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: imageUrl != null && imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          AppImages.general,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        AppImages.general,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? "No Title Available",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors
                                      .secondaryColor // Slightly muted white for dark mode
                                  : AppColors
                                      .secondaryColor, // Grey color for light mode
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        description ?? "No description available.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
