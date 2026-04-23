import 'package:flutter/material.dart';

class ChiTietVaoScreen extends StatelessWidget {
  const ChiTietVaoScreen({super.key});

  static const routeName = 'chi_tiet_vao';
  static const routePath = '/tang-trong/chi-tiet-vao';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.input_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Tăng trọng - Chi tiết vào',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Weight gain input details',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
