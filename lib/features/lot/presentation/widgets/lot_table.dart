import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              'Chưa có dữ liệu lô',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vui lòng tạo mới lô hoặc nhập từ Excel.',
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text('STT'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Mã lô'),
              ),
              DataColumn(
                label: Text('Tên lô'),
              ),
              DataColumn(
                label: Text('Người tạo'),
              ),
              DataColumn(
                label: Text('Người sửa'),
              ),
              DataColumn(
                label: Text('Hành động'),
              ),
            ],
            rows: lots.asMap().entries.map((entry) {
              final index = entry.key;
              final lot = entry.value;
              return LotTableRow(
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
        title: const Text('Xác nhận xóa'),
        content: const Text('Bạn có chắc muốn xóa lô này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(lotProvider.notifier).deleteLot(id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }

  void _editLot(BuildContext context, WidgetRef ref, Lot lot) {
    // Show confirmation dialog first
    showDialog(
      context: context,
      builder: (context) => EditConfirmationDialog(
        lot: lot,
        onConfirm: () {
          // Show edit dialog after confirmation
          showDialog(
            context: context,
            builder: (context) => EditLotDialog(
              lot: lot,
              onSave: () {
                // Refresh data after successful save
                ref.read(lotProvider.notifier).fetchLots(refresh: true);
              },
            ),
          );
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

  LotTableRow({
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
                    tooltip: 'Chỉnh sửa',
                    visualDensity: VisualDensity.compact,
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, size: 18),
                    tooltip: 'Xóa',
                    visualDensity: VisualDensity.compact,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        );
}

