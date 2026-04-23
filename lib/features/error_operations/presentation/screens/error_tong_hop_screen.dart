import 'package:flutter/material.dart';

class ErrorTongHopScreen extends StatelessWidget {
  const ErrorTongHopScreen({super.key});

  static const routeName = 'error_tong_hop';
  static const routePath = '/error-operations/tong-hop';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.summarize_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Thao tác lỗi - Tổng hợp',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Error operations summary',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
