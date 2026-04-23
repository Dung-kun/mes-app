import 'package:flutter/material.dart';

class SuaCaTongHopScreen extends StatelessWidget {
  const SuaCaTongHopScreen({super.key});

  static const routeName = 'sua_ca_tong_hop';
  static const routePath = '/sua-ca/tong-hop';

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
            'Sửa cá - Tổng hợp',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá summary',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
