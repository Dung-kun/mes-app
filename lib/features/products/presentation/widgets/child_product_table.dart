import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/features/products/domain/entities/product.dart';
import 'package:template_catra_mobile/features/products/presentation/providers/product_provider.dart';
import 'package:template_catra_mobile/features/products/presentation/screens/product_card_screen.dart';
import 'package:template_catra_mobile/shared/pagination/pagination_controls.dart';

class ChildProductTable extends ConsumerWidget {
  const ChildProductTable({super.key, required this.parentId});

  final String parentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childProducts = ref.watch(productProvider.select((s) => s.childProducts));
    final isLoading = ref.watch(productProvider.select((s) => s.isLoading));
    final currentPage = ref.watch(productProvider.select((s) => s.currentPage));
    final pageSize = ref.watch(productProvider.select((s) => s.pageSize));
    final totalCount = ref.watch(productProvider.select((s) => s.totalCount));
    debugPrint('Child products: $childProducts');
    // Filter child products only
    //final childProducts = products.where((p) => p.parentId == parentId).toList();

    if (isLoading && childProducts.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (childProducts.isEmpty && !isLoading) {
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
                  columnSpacing: 16,
                  headingRowColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                  ),
                  headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  dataRowMaxHeight: double.infinity,
                  columns: [
                    const DataColumn(
                      label: Text('STT'),
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text(context.l10n.code),
                    ),
                    DataColumn(
                      label: Text(context.l10n.name),
                    ),
                    DataColumn(
                      label: Text(context.l10n.g_min),
                    ),
                    DataColumn(
                      label: Text(context.l10n.g_max),
                    ),
                    DataColumn(
                      label: Text(context.l10n.note),
                    ),
                    DataColumn(
                      label: Text(context.l10n.actions),
                    ),
                  ],
                  rows: childProducts.asMap().entries.map((entry) {
                    final index = entry.key + (currentPage - 1) * pageSize;
                    final childProduct = entry.value;
                    return ChildProductTableRow(
                      context: context,
                      childProduct: childProduct,
                      index: index + 1,
                      onDelete: () => _deleteChildProduct(context, ref, childProduct.id),
                      onEdit: () => _editChildProduct(context, ref, childProduct),
                    );
                  }).toList(),
                ),
              ),
            );
          }
        ),
        
        // Pagination
        if (childProducts.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: PaginationControls(
              currentPage: currentPage,
              pageSize: pageSize,
              totalCount: totalCount,
              onPageChanged: (page) {
                ref.read(productProvider.notifier).fetchProducts(page: page);
              },
              onPageSizeChanged: (size) {
                ref.read(productProvider.notifier).setPageSize(size);
              },
            ),
          ),
      ],
    );
  }

  void _deleteChildProduct(BuildContext context, WidgetRef ref, int id) {
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
              final result = await ref.read(productProvider.notifier).deleteProduct(id);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: result 
                      ? Text(context.l10n.product_deleted_successfully)
                      : Text(context.l10n.product_deletion_failed),
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

  void _editChildProduct(BuildContext context, WidgetRef ref, Product childProduct) {
    // TODO: Implement edit child product dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Chức năng sửa sản phẩm con đang phát triển'),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

class ChildProductTableRow extends DataRow {
  final Product childProduct;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final BuildContext context;

  ChildProductTableRow({
    required this.context,
    required this.childProduct,
    required this.index,
    required this.onDelete,
    required this.onEdit,
  }) : super(
          cells: [
            DataCell(Text(index.toString())),
            DataCell(
              Text(
                childProduct.code,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            DataCell(Text(childProduct.description)),
            DataCell(Text(childProduct.wWin?.toString() ?? '-')),
            DataCell(Text(childProduct.wMax?.toString() ?? '-')),
            DataCell(
              Text(
                childProduct.note ?? '-',
                style: TextStyle(
                  color: childProduct.note != null ? Colors.black : Colors.grey.shade400,
                ),
              ),
            ),
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, size: 18),
                    tooltip: context.l10n.updated,
                    visualDensity: VisualDensity.compact,
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, size: 18),
                    tooltip: context.l10n.delete_product,
                    visualDensity: VisualDensity.compact,
                    color: Colors.red,
                  ),
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(
                        ProductCardScreen.routeName,
                        pathParameters: {
                          'productId': childProduct.id.toString(),
                        },
                      );
                    },
                    icon: const Icon(Icons.credit_card, size: 18),
                    tooltip: context.l10n.card_code,
                    visualDensity: VisualDensity.compact,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        );
}