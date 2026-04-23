import 'package:flutter/material.dart';

class ToHopKhongLayDuocScreen extends StatelessWidget {
  const ToHopKhongLayDuocScreen({super.key});

  static const routeName = 'to_hop_khong_lay_duoc';
  static const routePath = '/tui-le/to-hop-khong-lay-duoc';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.block_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Túi lẻ - Tổ hợp không lấy được',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Túi lẻ unprocessed items',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
