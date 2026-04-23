import 'package:flutter/material.dart';

class ToHopTheoSizeScreen extends StatelessWidget {
  const ToHopTheoSizeScreen({super.key});

  static const routeName = 'to_hop_theo_size';
  static const routePath = '/tui-le/to-hop-theo-size';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Túi lẻ - Tổ hợp theo size',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Túi lẻ grouped by size',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
