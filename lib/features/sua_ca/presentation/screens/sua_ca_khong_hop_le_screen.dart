import 'package:flutter/material.dart';

class SuaCaKhongHopLeScreen extends StatelessWidget {
  const SuaCaKhongHopLeScreen({super.key});

  static const routeName = 'sua_ca_khong_hop_le';
  static const routePath = '/sua-ca/khong-hop-le';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Sửa cá - Không hợp lệ',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá invalid records',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
