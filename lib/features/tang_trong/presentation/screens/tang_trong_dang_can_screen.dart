import 'package:flutter/material.dart';

class TangTrongDangCanScreen extends StatelessWidget {
  const TangTrongDangCanScreen({super.key});

  static const routeName = 'tang_trong_dang_can';
  static const routePath = '/tang-trong/dang-can';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.scale_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Tăng trọng - Đang cân',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Weight gain currently weighing',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
