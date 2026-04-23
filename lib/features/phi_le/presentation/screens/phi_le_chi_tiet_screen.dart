import 'package:flutter/material.dart';

class PhiLeChiTietScreen extends StatelessWidget {
  const PhiLeChiTietScreen({super.key});

  static const routeName = 'phi_le_chi_tiet';
  static const routePath = '/phi-le/chi-tiet';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.list_alt_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Phi lê - Chi tiết',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Phi lê detailed view',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
