import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/features/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:template_catra_mobile/shared/widgets/app_loading_shimmer.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  static const routeName = 'dashboard';
  static const routePath = '/dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(dashboardControllerProvider.future),
        child: state.when(
          loading: () => const AppLoadingShimmer(),
          error: (error, stackTrace) => ListView(
            children: [Center(child: Padding(
              padding: AppSpacing.screenPadding,
              child: Text(error.toString()),
            ))],
          ),
          data: (metrics) => ListView(
            padding: AppSpacing.screenPadding,
            children: [
              Text(
                'Operations snapshot',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'This is the mobile-native dashboard shell that will replace the current web admin landing page.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              ...metrics.map(
                (metric) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: Card(
                    child: ListTile(
                      title: Text(metric.label),
                      subtitle: Text(metric.delta),
                      trailing: Text(
                        metric.value,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
