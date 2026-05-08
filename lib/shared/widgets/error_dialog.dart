import 'package:flutter/material.dart';

/// Reusable error dialog widget
class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onDismiss;
  final VoidCallback? onRetry;
  final String retryText;
  final String dismissText;

  const ErrorDialog({
    super.key,
    required this.message,
    this.title = 'Lỗi',
    this.onDismiss,
    this.onRetry,
    this.retryText = 'Thử lại',
    this.dismissText = 'Đóng',
  });

  @override
  Widget build(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 8,
    backgroundColor: Colors.white,
    titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
    actionsPadding: const EdgeInsets.fromLTRB(12, 8, 12, 12),

    title: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.error_outline,
            color: Colors.red.shade600,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),

    content: Text(
      message,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade700,
        height: 1.4,
      ),
    ),

    actions: [
      if (onRetry != null)
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onRetry?.call();
          },
          child: Text(retryText),
        ),

      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade600,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 0,
        ),
        onPressed: () {
          Navigator.of(context).pop();
          onDismiss?.call();
        },
        child: Text(dismissText),
      ),
    ],
  );
}

  /// Static method to show error dialog
  static Future<void> show({
    required BuildContext context,
    required String message,
    String title = 'Lỗi',
    VoidCallback? onDismiss,
    VoidCallback? onRetry,
    String retryText = 'Thử lại',
    String dismissText = 'Đóng',
  }) {
    return showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        title: title,
        message: message,
        onDismiss: onDismiss,
        onRetry: onRetry,
        retryText: retryText,
        dismissText: dismissText,
      ),
    );
  }
}
