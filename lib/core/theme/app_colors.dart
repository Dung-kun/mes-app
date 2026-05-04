import 'package:flutter/material.dart';

/// Shared color scheme for consistent theming across the application
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ==================== PRIMARY COLORS ====================
  
  /// Main brand color - Blue
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF1565C0);
  
  /// Accent color - Orange
  static const Color accent = Color(0xFFFF9800);
  static const Color accentLight = Color(0xFFFFB74D);
  static const Color accentDark = Color(0xFFF57C00);

  // ==================== DOMINANT BRAND COLORS ====================
  
  /// Dominant brand colors for main UI elements
  static const Color brandPrimary = Color(0xFF2E7D32); // Green for success/growth
  static const Color brandSecondary = Color(0xFF1976D2); // Blue for trust
  static const Color brandAccent = Color(0xFFFF6F00); // Orange for energy
  
  /// Brand color variants
  static const Color brandPrimaryLight = Color(0xFF66BB6A);
  static const Color brandPrimaryDark = Color(0xFF2E7D32);
  static const Color brandSecondaryLight = Color(0xFF64B5F6);
  static const Color brandSecondaryDark = Color(0xFF1565C0);
  static const Color brandAccentLight = Color(0xFFFFA726);
  static const Color brandAccentDark = Color(0xFFE65100);

  // ==================== DOMINANT BACKGROUND COLORS ====================
  
  /// Main app backgrounds
  static const Color backgroundPrimary = Color(0xFFF5F5F5); // Light grey
  static const Color backgroundSecondary = Color(0xFFFAFAFA); // Very light grey
  static const Color backgroundTertiary = Color(0xFFEEEEEE); // Lighter grey
  
  /// Brand-specific backgrounds
  static const Color backgroundBrand = Color(0xFFE8F5E8); // Light green tint
  static const Color backgroundBrandSecondary = Color(0xFFE3F2FD); // Light blue tint
  static const Color backgroundBrandAccent = Color(0xFFFFF3E0); // Light orange tint
  
  /// Gradient backgrounds for screens
  static const Color gradientStart = Color(0xFFDBF4EA); // Light mint green
  static const Color gradientEnd = Color(0xFFF7F1E8); // Light warm beige
  static const Color gradientBrandStart = Color(0xFFE8F5E8); // Brand green
  static const Color gradientBrandEnd = Color(0xFFE3F2FD); // Brand blue

  // ==================== TEXT COLORS ====================
  
  /// Primary text color - Dark grey/black
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTertiary = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFFBDBDBD);
  
  /// White text for dark backgrounds
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnAccent = Color(0xFFFFFFFF);
  
  /// Text with specific semantic meaning
  static const Color textSuccess = Color(0xFF2E7D32);
  static const Color textError = Color(0xFFD32F2F);
  static const Color textWarning = Color(0xFFF57C00);
  static const Color textInfo = Color(0xFF1976D2);

  // ==================== BACKGROUND COLORS ====================
  
  /// Main scaffold background
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFFEEEEEE);
  
  /// Card and surface backgrounds
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF8F9FA);
  static const Color surfaceDisabled = Color(0xFFF5F5F5);
  
  /// Input field backgrounds
  static const Color inputBackground = Color(0xFFF8F9FA);
  static const Color inputBackgroundDisabled = Color(0xFFEEEEEE);

  // ==================== CARD & CONTAINER COLORS ====================
  
  /// Standard card colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE0E0E0);
  static const Color cardShadow = Color(0x1A000000);
  
  /// Elevated cards
  static const Color cardElevated = Color(0xFFFFFFFF);
  static const Color cardElevatedBorder = Color(0xFFE0E0E0);
  static const Color cardElevatedShadow = Color(0x33000000);
  
  /// Outlined cards
  static const Color cardOutlined = Color(0xFFFFFFFF);
  static const Color cardOutlinedBorder = Color(0xFF1976D2);
  
  /// Filled cards
  static const Color cardFilled = Color(0xFFF5F5F5);

  // ==================== BORDER & DIVIDER COLORS ====================
  
  /// Standard borders
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFEEEEEE);
  static const Color borderDark = Color(0xFFBDBDBD);
  static const Color borderFocus = Color(0xFF1976D2);
  
  /// Dividers
  static const Color divider = Color(0xFFE0E0E0);
  static const Color dividerLight = Color(0xFFEEEEEE);

  // ==================== STATUS COLORS ====================
  
  /// Success colors - Green
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);
  static const Color successBackground = Color(0xFFE8F5E8);
  
  /// Error colors - Red
  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFEF5350);
  static const Color errorDark = Color(0xFFD32F2F);
  static const Color errorBackground = Color(0xFFFFEBEE);
  
  /// Warning colors - Orange
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);
  static const Color warningBackground = Color(0xFFFFF3E0);
  
  /// Info colors - Blue
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);
  static const Color infoBackground = Color(0xFFE3F2FD);

  // ==================== BUTTON COLORS ====================
  
  /// Primary button
  static const Color buttonPrimary = Color(0xFF1976D2);
  static const Color buttonPrimaryHover = Color(0xFF1565C0);
  static const Color buttonPrimaryDisabled = Color(0xFFBDBDBD);
  
  /// Secondary button
  static const Color buttonSecondary = Color(0xFFFFFFFF);
  static const Color buttonSecondaryBorder = Color(0xFF1976D2);
  static const Color buttonSecondaryText = Color(0xFF1976D2);
  
  /// Outline button
  static const Color buttonOutline = Color(0xFFFFFFFF);
  static const Color buttonOutlineBorder = Color(0xFF1976D2);
  static const Color buttonOutlineText = Color(0xFF1976D2);
  
  /// Text button
  static const Color buttonText = Color(0xFF1976D2);
  static const Color buttonTextDisabled = Color(0xFFBDBDBD);

  // ==================== ICON COLORS ====================
  
  /// Primary icons
  static const Color iconPrimary = Color(0xFF1976D2);
  static const Color iconSecondary = Color(0xFF757575);
  static const Color iconTertiary = Color(0xFF9E9E9E);
  static const Color iconDisabled = Color(0xFFBDBDBD);
  
  /// Colored icons
  static const Color iconSuccess = Color(0xFF4CAF50);
  static const Color iconError = Color(0xFFF44336);
  static const Color iconWarning = Color(0xFFFF9800);
  static const Color iconInfo = Color(0xFF2196F3);

  // ==================== OVERLAY & SHADOW COLORS ====================
  
  /// Overlays
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);
  
  /// Shadows
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);
  static const Color shadowDark = Color(0x33000000);

  // ==================== GRADIENTS ====================
  
  /// Primary gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// Success gradient
  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// Error gradient
  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFF44336), Color(0xFFEF5350)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// Dominant brand gradients
  static const LinearGradient brandPrimaryGradient = LinearGradient(
    colors: [brandPrimary, brandPrimaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient brandSecondaryGradient = LinearGradient(
    colors: [brandSecondary, brandSecondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient brandAccentGradient = LinearGradient(
    colors: [brandAccent, brandAccentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// Main app background gradients
  static const LinearGradient mainBackgroundGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient brandBackgroundGradient = LinearGradient(
    colors: [gradientBrandStart, gradientBrandEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// Login screen gradient
  static const LinearGradient loginBackgroundGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ==================== SEMANTIC COLORS ====================
  
  /// Rating colors
  static const Color ratingActive = Color(0xFFFFB300);
  static const Color ratingInactive = Color(0xFFE0E0E0);
  
  /// Badge colors
  static const Color badgePrimary = Color(0xFF1976D2);
  static const Color badgeSuccess = Color(0xFF4CAF50);
  static const Color badgeError = Color(0xFFF44336);
  static const Color badgeWarning = Color(0xFFFF9800);
  
  /// Tag colors
  static const Color tagDefault = Color(0xFFE0E0E0);
  static const Color tagPrimary = Color(0xFFE3F2FD);
  static const Color tagSuccess = Color(0xFFE8F5E8);
  static const Color tagError = Color(0xFFFFEBEE);
  static const Color tagWarning = Color(0xFFFFF3E0);

  // ==================== UTILITY METHODS ====================
  
  /// Get color based on theme brightness
  static Color adaptive(BuildContext context, Color light, Color dark) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }
  
  /// Get text color based on background
  static Color getTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
  
  /// Get appropriate status color
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
      case 'completed':
      case 'active':
        return success;
      case 'error':
      case 'failed':
      case 'inactive':
        return error;
      case 'warning':
      case 'pending':
        return warning;
      case 'info':
      case 'processing':
        return info;
      default:
        return textSecondary;
    }
  }
}
