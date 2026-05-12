import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/core/utils/api_error_helper.dart';
import 'package:template_catra_mobile/shared/widgets/app_card.dart';
import 'package:template_catra_mobile/shared/widgets/error_dialog.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/features/products/presentation/providers/product_provider.dart';
import 'package:template_catra_mobile/features/products/presentation/widgets/create_product_form.dart';
import 'package:template_catra_mobile/features/products/presentation/widgets/product_table.dart';
import 'package:template_catra_mobile/features/products/presentation/widgets/import_product_section.dart';

class ParentProductScreen extends ConsumerStatefulWidget {
  const ParentProductScreen({super.key});

  static const routeName = 'parent_product';
  static const routePath = '/products/parent-product';

  @override
  ConsumerState<ParentProductScreen> createState() => _ParentProductScreenState();
}

class _ParentProductScreenState extends ConsumerState<ParentProductScreen> {
  final ScrollController _scrollController = ScrollController();
  String? _lastError;

  @override
  void initState() {
    super.initState();
    // Fetch initial data
    Future.microtask(() {
      ref.read(productProvider.notifier).setParentId('0');
    }); 
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _lastError != error) {
        _lastError = error;
        ErrorDialog.show(
          context: context,
          message: error,
          title: 'Lỗi',
          onDismiss: () {
            ref.read(productProvider.notifier).clearError();
            _lastError = null;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final error = ref.watch(productProvider.select((s) => s.error));
    final errorType = ref.watch(productProvider.select((s) => s.errorType));
    final isLoading = ref.watch(productProvider.select((s) => s.isLoading));

    // Show error dialog when error occurs
    if (error != null && errorType != null) {
      _showErrorDialog(mapErrorToMessage(errorType, context.l10n));
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(productProvider.notifier).fetchProducts(refresh: true);
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.product_list,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.l10n.product_list,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              LayoutBuilder(
                builder: (context, constraints) {
                  final isTablet = constraints.maxWidth >= 468;

                  if (isTablet) {
                    return Column(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                          child: AppCard(
                            title: context.l10n.manual_add_title,
                            child: const CreateProductForm(
                              isParent: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                          child: AppCard(
                            title: context.l10n.import_excel,
                            child: const ImportProductSection(),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                          child: AppCard(
                            title: context.l10n.manual_add_title,
                            child: const CreateProductForm(
                              isParent: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                          child: AppCard(
                            title: context.l10n.import_excel,
                            child: const ImportProductSection(),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              
              // Product list
              AppCard(
                title: context.l10n.product_list,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        const ProductTable(),
                        if (isLoading)
                          const Positioned.fill(
                            top: 0,
                            child: ColoredBox(
                              color: Colors.black26,
                              child: Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32), // Extra padding at bottom
            ],
          ),
        ),
      ),
    );
  }

}
