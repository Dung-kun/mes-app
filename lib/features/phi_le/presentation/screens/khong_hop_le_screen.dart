import 'package:flutter/material.dart';

class KhongHopLeScreen extends StatelessWidget {
  const KhongHopLeScreen({super.key});

  static const routeName = 'khong_hop_le';
  static const routePath = '/phi-le/khong-hop-le';

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
            'Phi lê - Không hợp lệ',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Phi lê invalid records',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
