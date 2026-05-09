import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';
import 'package:template_catra_mobile/features/lot/presentation/providers/lot_provider.dart';
import 'package:template_catra_mobile/features/lot/presentation/widgets/edit_lot_dialog.dart';
import 'package:template_catra_mobile/shared/pagination/pagination_controls.dart';

class LotTable extends ConsumerWidget {
  const LotTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lots = ref.watch(lotProvider.select((s) => s.lots));
    final isLoading = ref.watch(lotProvider.select((s) => s.isLoading));
    final currentPage = ref.watch(lotProvider.select((s) => s.currentPage));
    final pageSize = ref.watch(lotProvider.select((s) => s.pageSize));
    final totalCount = ref.watch(lotProvider.select((s) => s.totalCount));

    if (isLoading && lots.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (lots.isEmpty && !isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.no_data_available,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.lot_creation_failed,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Table
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                ),
                child: DataTable(
                  columns: [
                    const DataColumn(
                      label: Text('STT'),
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text(context.l10n.material_batch_code),
                    ),
                    DataColumn(
                      label: Text(context.l10n.material_batch_name),
                    ),
                    DataColumn(
                      label: Text(context.l10n.created_by),
                    ),
                    DataColumn(
                      label: Text(context.l10n.updated_by),
                    ),
                    DataColumn(
                      label: Text(context.l10n.actions),
                    ),
                  ],
                  rows: lots.asMap().entries.map((entry) {
                    final index = entry.key + (currentPage - 1) * pageSize;
                    final lot = entry.value;
                    return LotTableRow(
                      context: context,
                      lot: lot,
                      index: index + 1,
                      onDelete: () => _deleteLot(context, ref, lot.id),
                      onEdit: () => _editLot(context, ref, lot),
                    );
                  }).toList(),
                  columnSpacing: 16,
                  headingRowColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                  ),
                  headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  dataRowMaxHeight: double.infinity,
                ),
              ),
            );
          }
        ),
        
        // Pagination
        if (lots.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: PaginationControls(
              currentPage: currentPage,
              pageSize: pageSize,
              totalCount: totalCount,
              onPageChanged: (page) {
                ref.read(lotProvider.notifier).fetchLots(page: page);
              },
              onPageSizeChanged: (size) {
                ref.read(lotProvider.notifier).setPageSize(size);
              },
            ),
          ),
      ],
    );
  }

  void _deleteLot(BuildContext context, WidgetRef ref, int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.confirm_deletion),
        content: Text(context.l10n.are_you_sure_you_want_to_delete),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final result = await ref.read(lotProvider.notifier).deleteLot(id);
              if (context.mounted) {
                Navigator.of(context).pop();
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: result 
                      ? Text(context.l10n.lot_deleted_successfully)
                      : Text(context.l10n.material_deletion_failed),
                    backgroundColor: result ? AppColors.success : AppColors.error,
                  ),
                );
              }
            },    
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(context.l10n.delete_group),
          ),
        ],
      ),
    );
  }

  void _editLot(BuildContext context, WidgetRef ref, Lot lot) {
    showDialog(
      context: context,
      builder: (editLotContext) => EditLotDialog(
        lot: lot,
        onSave: (String code, String description) async {
          final confirmed = await showDialog<bool>(
            context: editLotContext,
            builder: (confirmContext) => EditConfirmationDialog(
              lot: lot,
              onConfirm: () => Navigator.of(confirmContext).pop(true),  // trả về true
              // nút Hủy pop(false) hoặc pop() → null
            ),
          );
          if (confirmed == true) {
            final result = await ref.read(lotProvider.notifier).updateLot(
              id: lot.id,
              code: code,
              description: description,
            );
            if (editLotContext.mounted) {
              ScaffoldMessenger.of(editLotContext).showSnackBar(
                SnackBar(
                  content: result 
                    ? Text(editLotContext.l10n.lot_updated_successfully)
                    : Text(editLotContext.l10n.lot_update_failed),
                  backgroundColor: result ? AppColors.success : AppColors.error,
                ),
              );
            }
          }
          return confirmed;
          // Show confirmation after filling in info
        },
      ),
    );
  }
}

class LotTableRow extends DataRow {
  final Lot lot;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final BuildContext context;

  LotTableRow({
    required this.context,
    required this.lot,
    required this.index,
    required this.onDelete,
    required this.onEdit,
  }) : super(
          cells: [
            DataCell(Text(index.toString())),
            DataCell(
              Text(
                lot.code,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            DataCell(Text(lot.description)),
            DataCell(Text(lot.createdBy)),
            DataCell(Text(lot.editedBy ?? '-')),
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, size: 18),
                    tooltip: context.l10n.edit_group,
                    visualDensity: VisualDensity.compact,
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, size: 18),
                    tooltip: context.l10n.delete_group,
                    visualDensity: VisualDensity.compact,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        );
}

