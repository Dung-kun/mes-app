import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/features/workers/domain/entities/worker.dart';
import 'package:template_catra_mobile/features/workers/presentation/providers/worker_filters_provider.dart';
import 'package:template_catra_mobile/features/workers/presentation/providers/workers_controller.dart';
import 'package:template_catra_mobile/features/workers/presentation/screens/worker_detail_screen.dart';
import 'package:template_catra_mobile/shared/widgets/app_empty_state.dart';
import 'package:template_catra_mobile/shared/widgets/app_loading_shimmer.dart';

class WorkersScreen extends ConsumerWidget {
  const WorkersScreen({super.key});

  static const routeName = 'workers';
  static const routePath = '/workers';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workersState = ref.watch(workersControllerProvider);
    final filters = ref.watch(workerFiltersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Workers')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(WorkerDetailScreen.createRoutePath),
        icon: const Icon(Icons.add),
        label: const Text('New worker'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(workersControllerProvider.notifier).refresh(),
        child: workersState.when(
          loading: () => const AppLoadingShimmer(),
          error: (error, stackTrace) => ListView(
            padding: AppSpacing.screenPadding,
            children: [Text(error.toString())],
          ),
          data: (workers) {
            final activeCount = workers.where((worker) => worker.isActive).length;
            final withoutCardCount = workers.where((worker) => worker.cardCode == null).length;

            return ListView(
              padding: AppSpacing.screenPadding,
              children: [
                Text(
                  'Workforce roster',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'The mobile roster keeps the same operational intent as the web worker module but drops the table-first interaction.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: ref.read(workersControllerProvider.notifier).search,
                        decoration: const InputDecoration(
                          labelText: 'Search workers',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    FilterChip(
                      label: const Text('Active only'),
                      selected: filters.activeOnly,
                      onSelected: ref.read(workersControllerProvider.notifier).setActiveOnly,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: _WorkerSummaryCard(
                        label: 'Active',
                        value: '$activeCount',
                        icon: Icons.badge_outlined,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: _WorkerSummaryCard(
                        label: 'No card',
                        value: '$withoutCardCount',
                        icon: Icons.credit_card_off_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                if (workers.isEmpty)
                  const AppEmptyState(
                    title: 'No workers found',
                    message: 'Mock workers are wired and ready for repository replacement.',
                  )
                else
                  ...workers.map(
                    (worker) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: _WorkerCard(
                        worker: worker,
                        onTap: () => context.push('/workers/${worker.id}'),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _WorkerSummaryCard extends StatelessWidget {
  const _WorkerSummaryCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: AppSpacing.md),
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.xs),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class _WorkerCard extends StatelessWidget {
  const _WorkerCard({
    required this.worker,
    required this.onTap,
  });

  final Worker worker;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = worker.isActive;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(worker.name, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: AppSpacing.xs),
                        Text('${worker.code}  ${worker.groupCode}'),
                      ],
                    ),
                  ),
                  Chip(
                    label: Text(isActive ? 'Active' : 'Inactive'),
                    avatar: Icon(
                      isActive ? Icons.check_circle_outline : Icons.pause_circle_outline,
                      size: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(worker.groupName),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      worker.cardCode == null ? 'No RFID card assigned' : 'Card ${worker.cardCode}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  if (worker.note.isNotEmpty)
                    Flexible(
                      child: Text(
                        worker.note,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
