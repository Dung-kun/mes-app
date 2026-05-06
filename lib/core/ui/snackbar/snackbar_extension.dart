import 'package:flutter/material.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';

enum SnackType {
  success,
  error,
  info,
  warning,
}
extension SnackBarX on BuildContext {
  void showSnack(
    String message, {
    SnackType type = SnackType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    Color color;

    switch (type) {
      case SnackType.success:
        color = AppColors.success;
        break;
      case SnackType.error:
        color = AppColors.error;
        break;
      case SnackType.info:
        color = AppColors.info;
        break;
      case SnackType.warning:
        color = AppColors.warning;
        break;
    }

    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
          duration: duration,
          behavior: SnackBarBehavior.floating, // 🔥 đẹp hơn
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  }
}