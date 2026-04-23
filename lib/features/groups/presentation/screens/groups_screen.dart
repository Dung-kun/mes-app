import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/features/groups/domain/entities/group.dart';
import 'package:template_catra_mobile/features/groups/presentation/providers/groups_controller.dart';
import 'package:template_catra_mobile/features/groups/presentation/screens/group_detail_screen.dart';
import 'package:template_catra_mobile/shared/widgets/app_loading_shimmer.dart';

class GroupsScreen extends ConsumerWidget {
  const GroupsScreen({super.key});

  static const routeName = 'groups';
  static const routePath = '/groups';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsState = ref.watch(groupsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Groups')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(GroupDetailScreen.createRoutePath),
        icon: const Icon(Icons.add),
        label: const Text('New group'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(groupsControllerProvider.notifier).refresh(),
        child: groupsState.when(
          loading: () => const AppLoadingShimmer(),
          error: (error, stackTrace) => ListView(
            padding: AppSpacing.screenPadding,
            children: [Text(error.toString())],
          ),
          data: (groups) {
            return ListView(
              padding: AppSpacing.screenPadding,
              children: [
                Text(
                  'Operational groups',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'This replaces the dense web table with a mobile-first roster of active departments.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                TextField(
                  onChanged: ref.read(groupsControllerProvider.notifier).search,
                  decoration: const InputDecoration(
                    labelText: 'Search groups',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                _SummaryStrip(groups: groups),
                const SizedBox(height: AppSpacing.lg),
                ...groups.map(
                  (group) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: _GroupCard(
                      group: group,
                      onTap: () => context.push('/groups/${group.id}'),
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

class _SummaryStrip extends StatelessWidget {
  const _SummaryStrip({required this.groups});

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
    final totalWorkers = groups.fold<int>(0, (sum, group) => sum + group.workerCount);

    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: 'Groups',
            value: '${groups.length}',
            accent: const Color(0xFF0F766E),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _SummaryCard(
            label: 'Workers assigned',
            value: '$totalWorkers',
            accent: const Color(0xFFEA580C),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.accent,
  });

  final String label;
  final String value;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
            ),
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

class _GroupCard extends StatelessWidget {
  const _GroupCard({
    required this.group,
    required this.onTap,
  });

  final Group group;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(group.description, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: AppSpacing.xs),
                        Text(group.code, style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Chip(
                    avatar: const Icon(Icons.groups_2_outlined, size: 18),
                    label: Text('${group.workerCount} workers'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(group.note),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  if (group.updatedBy != null)
                    Expanded(child: Text('Updated by ${group.updatedBy}', style: Theme.of(context).textTheme.bodySmall)),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
