import 'package:flutter/material.dart';

class SuaCaDangCanScreen extends StatelessWidget {
  const SuaCaDangCanScreen({super.key});

  static const routeName = 'sua_ca_dang_can';
  static const routePath = '/sua-ca/dang-can';

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
            'Sửa cá - Đang cân',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá currently weighing',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
