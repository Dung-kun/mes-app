import 'package:flutter/material.dart';

class SuaCaChiTietScreen extends StatelessWidget {
  const SuaCaChiTietScreen({super.key});

  static const routeName = 'sua_ca_chi_tiet';
  static const routePath = '/sua-ca/chi-tiet';

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
            'Sửa cá - Chi tiết',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá detailed view',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
