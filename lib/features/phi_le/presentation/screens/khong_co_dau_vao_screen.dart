import 'package:flutter/material.dart';

class KhongCoDauVaoScreen extends StatelessWidget {
  const KhongCoDauVaoScreen({super.key});

  static const routeName = 'khong_co_dau_vao';
  static const routePath = '/phi-le/khong-co-dau-vao';

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
            'Phi lê - Không có đầu vào',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Phi lê without input',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
