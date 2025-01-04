import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static void showError(BuildContext context, String message) {
    _showToast(
      context,
      message,
      ToastificationType.error,
      Icons.error,
    );
  }

  static void showWarning(BuildContext context, String message,
      [Alignment? alignment, EdgeInsets? margin]) {
    _showToast(context, message, ToastificationType.warning, Icons.warning,
        alignment, margin);
  }

  static void _showToast(BuildContext context, String message,
      ToastificationType type, IconData icon,
      [Alignment? alignment, EdgeInsets? margin]) {
    final toast = Toastification();
    toast.show(
      context: context,
      type: type,
      showProgressBar: false,
      style: ToastificationStyle.flatColored,
      title: Text(message,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12)),
      alignment: alignment ?? Alignment.bottomCenter,
      margin: margin,
      autoCloseDuration: const Duration(seconds: 3),
      icon: Icon(icon),
      closeButtonShowType: CloseButtonShowType.none,
    );
  }
}
