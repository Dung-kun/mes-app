import 'package:flutter/material.dart';

class SuaCaTheoCanSauLangDaScreen extends StatelessWidget {
  const SuaCaTheoCanSauLangDaScreen({super.key});

  static const routeName = 'sua_ca_theo_can_sau_lang_da';
  static const routePath = '/sua-ca/theo-can-sau-lang-da';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.monitor_weight_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Sửa cá - Theo cân sau lạng da',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá by final weight',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
