import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/features/groups/domain/entities/group.dart';
import 'package:template_catra_mobile/features/groups/presentation/providers/group_by_id_provider.dart';
import 'package:template_catra_mobile/features/groups/presentation/providers/group_form_provider.dart';
import 'package:template_catra_mobile/features/groups/presentation/providers/groups_controller.dart';
import 'package:template_catra_mobile/shared/widgets/app_async_view.dart';

class GroupDetailScreen extends ConsumerWidget {
  const GroupDetailScreen({super.key, this.groupId});

  static const routeName = 'group-detail';
  static const routePath = '/groups/:groupId';
  static const createRouteName = 'group-create';
  static const createRoutePath = '/groups/create';

  final String? groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (groupId == null || groupId!.isEmpty) {
      ref.read(groupFormProvider.notifier).seed(null);
      final formState = ref.watch(groupFormProvider);
      return _GroupEditor(
        title: 'Create group',
        formState: formState,
        onCodeChanged: ref.read(groupFormProvider.notifier).setCode,
        onDescriptionChanged: ref.read(groupFormProvider.notifier).setDescription,
        onNoteChanged: ref.read(groupFormProvider.notifier).setNote,
        onSave: () => _save(context, ref, null, formState),
      );
    }

    final groupState = ref.watch(groupByIdProvider(groupId!));

    return Scaffold(
      appBar: AppBar(title: const Text('Group detail')),
      body: AppAsyncView(
        value: groupState,
        data: (group) {
          if (group == null) {
            return const Center(child: Text('Group not found'));
          }

          ref.read(groupFormProvider.notifier).seed(group);
          final formState = ref.watch(groupFormProvider);

          return _GroupEditor(
            title: 'Edit group',
            group: group,
            formState: formState,
            onCodeChanged: ref.read(groupFormProvider.notifier).setCode,
            onDescriptionChanged: ref.read(groupFormProvider.notifier).setDescription,
            onNoteChanged: ref.read(groupFormProvider.notifier).setNote,
            onSave: () => _save(context, ref, group, formState),
            onDelete: () => _delete(context, ref, group.id),
          );
        },
      ),
    );
  }

  Future<void> _save(
    BuildContext context,
    WidgetRef ref,
    Group? existing,
    GroupFormState formState,
  ) async {
    final group = Group(
      id: existing?.id ?? '',
      code: formState.code.trim(),
      description: formState.description.trim(),
      note: formState.note.trim(),
      workerCount: existing?.workerCount ?? 0,
      createdBy: existing?.createdBy,
      updatedBy: 'mobile.mock',
    );

    await ref.read(groupsControllerProvider.notifier).save(group);
    if (context.mounted) {
      context.pop();
    }
  }

  Future<void> _delete(BuildContext context, WidgetRef ref, String id) async {
    await ref.read(groupsControllerProvider.notifier).delete(id);
    if (context.mounted) {
      context.pop();
    }
  }
}

class _GroupEditor extends StatelessWidget {
  const _GroupEditor({
    required this.title,
    required this.formState,
    required this.onCodeChanged,
    required this.onDescriptionChanged,
    required this.onNoteChanged,
    required this.onSave,
    this.group,
    this.onDelete,
  });

  final String title;
  final GroupFormState formState;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onDescriptionChanged;
  final ValueChanged<String> onNoteChanged;
  final VoidCallback onSave;
  final Group? group;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (onDelete != null)
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
            ),
        ],
      ),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          if (group != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(group!.description, style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: AppSpacing.sm),
                    Text(group!.code),
                    const SizedBox(height: AppSpacing.md),
                    Text(group!.note),
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(label: Text('${group!.workerCount} workers')),
                        if (group!.updatedBy != null) Chip(label: Text('Updated by ${group!.updatedBy}')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          if (group != null) const SizedBox(height: AppSpacing.lg),
          Text('Group form', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: TextEditingController(text: formState.code),
            onChanged: onCodeChanged,
            decoration: const InputDecoration(labelText: 'Code'),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: TextEditingController(text: formState.description),
            onChanged: onDescriptionChanged,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: TextEditingController(text: formState.note),
            onChanged: onNoteChanged,
            decoration: const InputDecoration(labelText: 'Note'),
            maxLines: 3,
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton(
            onPressed: formState.isValid ? onSave : null,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
