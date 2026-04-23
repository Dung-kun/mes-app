import 'package:flutter/material.dart';

class TheoCanSauLangDaScreen extends StatelessWidget {
  const TheoCanSauLangDaScreen({super.key});

  static const routeName = 'theo_can_sau_lang_da';
  static const routePath = '/phi-le/theo-can-sau-lang-da';

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
            'Phi lê - Theo cân sau lạng da',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Phi lê by final weight',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
