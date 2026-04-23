import 'package:flutter/material.dart';

class NgoaiDinhMucScreen extends StatelessWidget {
  const NgoaiDinhMucScreen({super.key});

  static const routeName = 'ngoai_dinh_muc';
  static const routePath = '/phi-le/ngoai-dinh-muc';

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
            'Phi lê - Ngoài định mức',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Phi lê exceeding limits',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
