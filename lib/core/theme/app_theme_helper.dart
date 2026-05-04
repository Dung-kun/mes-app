import 'package:flutter/material.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';

/// Helper class for consistent theming across the app
class AppThemeHelper {
  // Private constructor to prevent instantiation
  AppThemeHelper._();

  /// Get consistent card decoration
  static BoxDecoration getCardDecoration({
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 12,
    bool hasShadow = true,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.surface,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor ?? AppColors.border,
        width: 1,
      ),
      boxShadow: hasShadow ? [
        const BoxShadow(
          color: AppColors.shadow,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ] : null,
    );
  }

  /// Get consistent input decoration
  static InputDecoration getInputDecoration({
    String? labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
    bool enabled = true,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText,
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.borderLight,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.borderFocus,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
      filled: true,
      fillColor: enabled ? AppColors.inputBackground : AppColors.inputBackgroundDisabled,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
    );
  }

  /// Get consistent button style for primary buttons
  static ButtonStyle getPrimaryButtonStyle({
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.buttonPrimary,
      foregroundColor: foregroundColor ?? AppColors.textOnPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
    );
  }

  /// Get consistent button style for secondary buttons
  static ButtonStyle getSecondaryButtonStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.buttonSecondaryText,
      side: const BorderSide(color: AppColors.buttonSecondaryBorder),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// Get consistent text styles
  static TextStyle getHeadlineStyle(BuildContext context) {
    return const TextStyle(
      color: AppColors.textPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
  }

  static TextStyle getBodyStyle(BuildContext context) {
    return const TextStyle(
      color: AppColors.textSecondary,
      fontSize: 16,
    );
  }

  static TextStyle getCaptionStyle(BuildContext context) {
    return const TextStyle(
      color: AppColors.textTertiary,
      fontSize: 12,
    );
  }

  /// Get consistent snackbar theme
  static SnackBarThemeData getSnackBarTheme() {
    return SnackBarThemeData(
      backgroundColor: AppColors.surface,
      contentTextStyle: const TextStyle(color: AppColors.textPrimary),
      actionTextColor: AppColors.primary,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// Get status-based color
  static Color getStatusColor(String status) {
    return AppColors.getStatusColor(status);
  }

  /// Get gradient for main screens
  static BoxDecoration getMainScreenGradient() {
    return const BoxDecoration(
      gradient: AppColors.mainBackgroundGradient,
    );
  }

  /// Get gradient for login screens
  static BoxDecoration getLoginScreenGradient() {
    return const BoxDecoration(
      gradient: AppColors.loginBackgroundGradient,
    );
  }

  /// Get gradient for brand screens
  static BoxDecoration getBrandScreenGradient() {
    return const BoxDecoration(
      gradient: AppColors.brandBackgroundGradient,
    );
  }
}
