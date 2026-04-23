import 'package:flutter/material.dart';

class TheoCongNhanScreen extends StatelessWidget {
  const TheoCongNhanScreen({super.key});

  static const routeName = 'theo_cong_nhan';
  static const routePath = '/phi-le/theo-cong-nhan';

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
            'Phi lê - Theo công nhân',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Phi lê by worker',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
