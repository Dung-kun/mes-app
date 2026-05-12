import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/shared/widgets/app_card.dart';
import 'package:template_catra_mobile/features/products/presentation/providers/product_card_provider.dart';

class ProductCardScreen extends ConsumerStatefulWidget {
  const ProductCardScreen({
    super.key,
  });

  static const routeName = 'product_card';
  static const routePath = '/products/product-card';
  @override
  ConsumerState<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends ConsumerState<ProductCardScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final FocusNode _cardFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Initialize with product list
    Future.microtask(() {
      ref.read(productCardProvider.notifier).fetchProductCards();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _cardController.dispose();
    _cardFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardState = ref.watch(productCardProvider);

    if (cardState.isLoadingProducts) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (cardState.error != null) {
      return Scaffold(
        body: Center(
          child: Text('Đã xảy ra lỗi: ${cardState.error}'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(productCardProvider.notifier).fetchProductCards();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Selection Section
              _buildProductSelectionSection(context, cardState),
              const SizedBox(height: 24),
              // Service Card List Section
              _buildServiceCardListSection(context, ref.read(productCardProvider.notifier)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSelectionSection(BuildContext context, ProductCardState cardState) {
  return AppCard(
    title: 'Chọn sản phẩm',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Dropdown
        DropdownButtonFormField<String>(
          value: cardState.selectedProductId,
          decoration: InputDecoration(
            labelText: 'Sản phẩm',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          items: cardState.productList.map((product) {
            return DropdownMenuItem<String>(
              value: product.id.toString(),
              child: Text('${product.code} - ${product.description}'),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              ref.read(productCardProvider.notifier).selectProduct(value);
            }
          },
        ),
      ],
    ),
  );
}

Widget _buildServiceCardListSection(BuildContext context, ProductCardNotifier cardStateNotifier) {
    return AppCard(
      title: 'Danh sách thẻ dịch vụ',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Field
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        cardStateNotifier.setSearchQuery('');
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) {
              cardStateNotifier.setSearchQuery(value);
            },
          ),
          const SizedBox(height: 16),
          
          // Product List
          SizedBox(
            height: 200,
            child: _buildProductList(context, cardStateNotifier),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(BuildContext context, ProductCardNotifier cardStateNotifier) {
    final cardState = ref.read(productCardProvider);
    final products = cardState.productList;
    
    if (products.isEmpty) {
      return const Center(
        child: Text('Không tìm thấy sản phẩm'),
      );
    }

    final filteredProducts = products.where((product) {
      final query = cardState.searchQuery.toLowerCase();
      return product.code.toLowerCase().contains(query) ||
          product.description.toLowerCase().contains(query);
    }).toList();

    if (filteredProducts.isEmpty) {
      return const Center(
        child: Text('Không tìm thấy sản phẩm phù hợp'),
      );
    }

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        final isSelected = cardState.selectedProductId == product.id.toString();
        
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: isSelected ? AppColors.primary : Colors.grey.shade300,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            product.code,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.primary : Colors.black87,
            ),
          ),
          subtitle: Text(product.description),
          tileColor: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.white,
          onTap: () {
            ref.read(productCardProvider.notifier).selectProduct(product.id.toString());
          },
        );
      },
    );
  }

  
  }
