import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/features/products/presentation/providers/products_controller.dart';
import 'package:template_catra_mobile/shared/widgets/app_empty_state.dart';
import 'package:template_catra_mobile/shared/widgets/app_loading_shimmer.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  static const routeName = 'products';
  static const routePath = '/products';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(productsControllerProvider.future),
        child: state.when(
          loading: () => const AppLoadingShimmer(),
          error: (error, stackTrace) => ListView(
            children: [Center(child: Padding(
              padding: AppSpacing.screenPadding,
              child: Text(error.toString()),
            ))],
          ),
          data: (products) {
            if (products.isEmpty) {
              return const AppEmptyState(
                title: 'No products yet',
                message: 'Mock repository is wired. Real Laravel products can replace this layer later.',
              );
            }

            return ListView.separated(
              padding: AppSpacing.screenPadding,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    title: Text(product.description),
                    subtitle: Text('${product.code}  ${product.note}'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
