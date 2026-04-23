import 'package:flutter/material.dart';

class SuaCaKhongCoDauVaoScreen extends StatelessWidget {
  const SuaCaKhongCoDauVaoScreen({super.key});

  static const routeName = 'sua_ca_khong_co_dau_vao';
  static const routePath = '/sua-ca/khong-co-dau-vao';

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
            'Sửa cá - Không có đầu vào',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá without input',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
