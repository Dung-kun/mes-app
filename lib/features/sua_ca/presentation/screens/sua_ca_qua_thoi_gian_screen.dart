import 'package:flutter/material.dart';

class SuaCaQuaThoiGianScreen extends StatelessWidget {
  const SuaCaQuaThoiGianScreen({super.key});

  static const routeName = 'sua_ca_qua_thoi_gian';
  static const routePath = '/sua-ca/qua-thoi-gian';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Sửa cá - Quá thời gian',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Sửa cá overtime',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
