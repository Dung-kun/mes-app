import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/features/workers/domain/entities/worker.dart';
import 'package:template_catra_mobile/features/workers/presentation/providers/worker_form_provider.dart';
import 'package:template_catra_mobile/features/workers/presentation/providers/workers_controller.dart';
import 'package:template_catra_mobile/shared/widgets/app_async_view.dart';

class WorkerDetailScreen extends ConsumerWidget {
  const WorkerDetailScreen({super.key, this.workerId});

  static const routeName = 'worker-detail';
  static const routePath = '/workers/:workerId';
  static const createRouteName = 'worker-create';
  static const createRoutePath = '/workers/create';

  final String? workerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (workerId == null || workerId!.isEmpty) {
      ref.read(workerFormProvider.notifier).seed(null);
      final formState = ref.watch(workerFormProvider);
      return _WorkerEditor(
        title: 'Create worker',
        formState: formState,
        onCodeChanged: ref.read(workerFormProvider.notifier).setCode,
        onNameChanged: ref.read(workerFormProvider.notifier).setName,
        onGroupCodeChanged: ref.read(workerFormProvider.notifier).setGroupCode,
        onStatusChanged: ref.read(workerFormProvider.notifier).setStatus,
        onCardCodeChanged: ref.read(workerFormProvider.notifier).setCardCode,
        onNoteChanged: ref.read(workerFormProvider.notifier).setNote,
        onSave: () => _save(context, ref, null, formState),
      );
    }

    final workerState = ref.watch(workerByIdProvider(workerId!));

    return Scaffold(
      appBar: AppBar(title: const Text('Worker detail')),
      body: AppAsyncView(
        value: workerState,
        data: (worker) {
          if (worker == null) {
            return const Center(child: Text('Worker not found'));
          }

          ref.read(workerFormProvider.notifier).seed(worker);
          final formState = ref.watch(workerFormProvider);

          return _WorkerEditor(
            title: 'Edit worker',
            worker: worker,
            formState: formState,
            onCodeChanged: ref.read(workerFormProvider.notifier).setCode,
            onNameChanged: ref.read(workerFormProvider.notifier).setName,
            onGroupCodeChanged: ref.read(workerFormProvider.notifier).setGroupCode,
            onStatusChanged: ref.read(workerFormProvider.notifier).setStatus,
            onCardCodeChanged: ref.read(workerFormProvider.notifier).setCardCode,
            onNoteChanged: ref.read(workerFormProvider.notifier).setNote,
            onSave: () => _save(context, ref, worker, formState),
            onDelete: () => _delete(context, ref, worker.id),
          );
        },
      ),
    );
  }

  Future<void> _save(
    BuildContext context,
    WidgetRef ref,
    Worker? existing,
    WorkerFormState formState,
  ) async {
    final worker = Worker(
      id: existing?.id ?? '',
      code: formState.code.trim(),
      name: formState.name.trim(),
      groupCode: formState.groupCode.trim(),
      groupName: existing?.groupName ?? formState.groupCode.trim(),
      status: formState.status,
      cardCode: formState.cardCode.trim().isEmpty ? null : formState.cardCode.trim(),
      note: formState.note.trim(),
    );

    await ref.read(workersControllerProvider.notifier).save(worker);
    if (context.mounted) {
      context.pop();
    }
  }

  Future<void> _delete(BuildContext context, WidgetRef ref, String id) async {
    await ref.read(workersControllerProvider.notifier).delete(id);
    if (context.mounted) {
      context.pop();
    }
  }
}

class _WorkerEditor extends StatelessWidget {
  const _WorkerEditor({
    required this.title,
    required this.formState,
    required this.onCodeChanged,
    required this.onNameChanged,
    required this.onGroupCodeChanged,
    required this.onStatusChanged,
    required this.onCardCodeChanged,
    required this.onNoteChanged,
    required this.onSave,
    this.worker,
    this.onDelete,
  });

  final String title;
  final WorkerFormState formState;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onGroupCodeChanged;
  final ValueChanged<String> onStatusChanged;
  final ValueChanged<String> onCardCodeChanged;
  final ValueChanged<String> onNoteChanged;
  final VoidCallback onSave;
  final Worker? worker;
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
          if (worker != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(worker!.name, style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: AppSpacing.sm),
                    Text('${worker!.code}  ${worker!.groupName}'),
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(label: Text(worker!.isActive ? 'Active' : 'Inactive')),
                        Chip(label: Text(worker!.cardCode == null ? 'No card' : 'Card ${worker!.cardCode}')),
                      ],
                    ),
                    if (worker!.note.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.md),
                      Text(worker!.note),
                    ],
                  ],
                ),
              ),
            ),
          if (worker != null) const SizedBox(height: AppSpacing.lg),
          Text('Worker form', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: TextEditingController(text: formState.code),
            onChanged: onCodeChanged,
            decoration: const InputDecoration(labelText: 'Worker code'),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: TextEditingController(text: formState.name),
            onChanged: onNameChanged,
            decoration: const InputDecoration(labelText: 'Worker name'),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: TextEditingController(text: formState.groupCode),
            onChanged: onGroupCodeChanged,
            decoration: const InputDecoration(labelText: 'Group code'),
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<String>(
            value: formState.status,
            items: const [
              DropdownMenuItem(value: 'active', child: Text('Active')),
              DropdownMenuItem(value: 'inactive', child: Text('Inactive')),
            ],
            onChanged: (value) {
              if (value != null) {
                onStatusChanged(value);
              }
            },
            decoration: const InputDecoration(labelText: 'Status'),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: TextEditingController(text: formState.cardCode),
            onChanged: onCardCodeChanged,
            decoration: const InputDecoration(labelText: 'RFID card'),
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
