import 'package:flutter/material.dart';

class SuaCaTheoCongNhanScreen extends StatelessWidget {
  const SuaCaTheoCongNhanScreen({super.key});

  static const routeName = 'sua_ca_theo_cong_nhan';
  static const routePath = '/sua-ca/theo-cong-nhan';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Sửa cá - Theo công nhân',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá by worker',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
