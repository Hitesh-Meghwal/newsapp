import 'dart:io';

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;
  const CustomAppbar({super.key, required this.appbarTitle});

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
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Define preferred size;
}
