import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../lot/presentation/providers/lot_provider.dart';
import '../../../lot/presentation/widgets/create_lot_form.dart';
import '../../../lot/presentation/widgets/import_lot_section.dart';
import '../../../lot/presentation/widgets/lot_table.dart';
import '../../../lot/presentation/widgets/search_bar.dart';

class MaterialBatchCodeScreen extends ConsumerStatefulWidget {
  const MaterialBatchCodeScreen({super.key});

  static const routeName = 'material_batch_code';
  static const routePath = '/basic-data/material-batch-code';

  @override
  ConsumerState<MaterialBatchCodeScreen> createState() => _MaterialBatchCodeScreenState();
}

class _MaterialBatchCodeScreenState extends ConsumerState<MaterialBatchCodeScreen> {
  final ScrollController _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    final lotState = ref.watch(lotProvider);

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
                        'Quan Lý Lô',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Quan lý thông tin lô sa n xuât',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // SECTION 1: CREATE LOT FORM
              AppCard(
                title: 'Thêm thu công',
                child: CreateLotForm(),
              ),
              
              const SizedBox(height: 24),
              
              // SECTION 2: IMPORT EXCEL
              AppCard(
                title: 'Nhâp t Excel',
                child: ImportLotSection(),
              ),
              
              const SizedBox(height: 24),
              
              // SECTION 3: LOT LIST
              AppCard(
                title: 'Danh sách lô',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search bar and total count
                    LotSearchBar(),
                    
                    const SizedBox(height: 16),
                    
                    // Error display
                    if (lotState.error != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          border: Border.all(color: Colors.red.shade200),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red.shade600, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                lotState.error!,
                                style: TextStyle(color: Colors.red.shade600, fontSize: 14),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ref.read(lotProvider.notifier).clearError();
                              },
                              icon: const Icon(Icons.close, size: 18),
                              color: Colors.red.shade600,
                            ),
                          ],
                        ),
                      ),
                    
                    // Loading indicator for refresh
                    if (lotState.isLoading && lotState.lots.isNotEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    
                    // Lot table
                    LotTable(),
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
