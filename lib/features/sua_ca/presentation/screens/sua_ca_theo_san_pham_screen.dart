import 'package:flutter/material.dart';

class SuaCaTheoSanPhamScreen extends StatelessWidget {
  const SuaCaTheoSanPhamScreen({super.key});

  static const routeName = 'sua_ca_theo_san_pham';
  static const routePath = '/sua-ca/theo-san-pham';

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
            'Sửa cá - Theo sản phẩm',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá by product',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
