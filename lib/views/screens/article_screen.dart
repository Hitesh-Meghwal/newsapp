import 'package:flutter/material.dart';
import 'package:newsapp/utils/strings/app_strings.dart';
import 'package:newsapp/views/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final String url = Get.arguments['url'];

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarTitle: AppStrings.news),
      body: Column(
        children: [
          if (isLoading)
            const LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Colors.blue, // Customize the color of the progress bar.
            ),
          Expanded(
            child: WebViewWidget(controller: controller),
          ),
        ],
      ),
    );
  }
}
