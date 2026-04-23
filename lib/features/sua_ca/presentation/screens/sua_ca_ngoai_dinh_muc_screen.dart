import 'package:flutter/material.dart';

class SuaCaNgoaiDinhMucScreen extends StatelessWidget {
  const SuaCaNgoaiDinhMucScreen({super.key});

  static const routeName = 'sua_ca_ngoai_dinh_muc';
  static const routePath = '/sua-ca/ngoai-dinh-muc';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Sửa cá - Ngoài định mức',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá exceeding limits',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
