import 'package:flutter/material.dart';

class ErrorChiTietScreen extends StatelessWidget {
  const ErrorChiTietScreen({super.key});

  static const routeName = 'error_chi_tiet';
  static const routePath = '/error-operations/chi-tiet';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.list_alt_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Thao tác lỗi - Chi tiết',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Error operations detailed view',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
