import 'package:flutter/material.dart';

class TuiLeChiTietScreen extends StatelessWidget {
  const TuiLeChiTietScreen({super.key});

  static const routeName = 'tui_le_chi_tiet';
  static const routePath = '/tui-le/chi-tiet';

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
            'Túi lẻ - Chi tiết',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Túi lẻ detailed view',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
