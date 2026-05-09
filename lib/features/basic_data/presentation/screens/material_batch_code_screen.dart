import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/core/utils/api_error_helper.dart';
import 'package:template_catra_mobile/shared/widgets/app_card.dart';
import 'package:template_catra_mobile/shared/widgets/error_dialog.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/features/lot/presentation/providers/lot_provider.dart';
import 'package:template_catra_mobile/features/lot/presentation/widgets/create_lot_form.dart';
import 'package:template_catra_mobile/features/lot/presentation/widgets/import_lot_section.dart';
import 'package:template_catra_mobile/features/lot/presentation/widgets/lot_table.dart';
import 'package:template_catra_mobile/features/lot/presentation/widgets/search_bar.dart';

class MaterialBatchCodeScreen extends ConsumerStatefulWidget {
  const MaterialBatchCodeScreen({super.key});

  static const routeName = 'material_batch_code';
  static const routePath = '/basic-data/material-batch-code';

  @override
  ConsumerState<MaterialBatchCodeScreen> createState() => _MaterialBatchCodeScreenState();
}

class _MaterialBatchCodeScreenState extends ConsumerState<MaterialBatchCodeScreen> {
  final ScrollController _scrollController = ScrollController();
  String? _lastError;

  @override
  void initState() {
    super.initState();
    // Fetch initial data
    Future.microtask(() {
      ref.read(lotProvider.notifier).fetchLots(refresh: true);
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
            ref.read(lotProvider.notifier).clearError();
            _lastError = null;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final error = ref.watch(lotProvider.select((s) => s.error));
    final errorType = ref.watch(lotProvider.select((s) => s.errorType));
    final isLoading = ref.watch(lotProvider.select((s) => s.isLoading));
    final lots = ref.watch(lotProvider.select((s) => s.lots));

    // Show error dialog when error occurs
    if (error != null && errorType != null) {
      _showErrorDialog(mapErrorToMessage(errorType, context.l10n));
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(lotProvider.notifier).fetchLots(refresh: true);
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
                        context.l10n.lot,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.l10n.lot_data_statistics,
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
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                                child: AppCard(
                                  title: context.l10n.manual_add_title,
                                  child: const CreateLotForm(),
                                ),
                              ),
                              const SizedBox(height: 24),

                              ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                                child: AppCard(
                                  title: context.l10n.import_excel,
                                  child: const ImportLotSection(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                  // SECTION 1: CREATE LOT FORM
                    return Column(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                          child: AppCard(
                            title: context.l10n.manual_add_title,
                            child: const CreateLotForm(),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: AppSpacing.maxWidthAppCard),
                          child: AppCard(
                            title: context.l10n.import_excel,
                            child: const ImportLotSection(),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              
              // SECTION 3: LOT LIST
              AppCard(
                title: context.l10n.material_batch_list,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search bar and total count
                    const LotSearchBar(),
                    
                    const SizedBox(height: 16),
                    
                                        
                    // Loading indicator for refresh
                      // const Center(
                      //   child: Padding(
                      //     padding: EdgeInsets.all(10),
                      //     child: CircularProgressIndicator(constraints: BoxConstraints(minWidth: 20, minHeight: 20, maxWidth: 100, maxHeight: 100)),
                      //   ),
                      // ),
                    Stack(
                      children: [
                      const LotTable(),
                      if (isLoading && lots.isNotEmpty)
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
                    // Lot table
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
