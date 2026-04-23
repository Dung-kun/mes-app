import 'package:flutter/material.dart';

class TangTrongTongHopScreen extends StatelessWidget {
  const TangTrongTongHopScreen({super.key});

  static const routeName = 'tang_trong_tong_hop';
  static const routePath = '/tang-trong/tong-hop';

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
            'Tăng trọng - Tổng hợp',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Weight gain summary',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
