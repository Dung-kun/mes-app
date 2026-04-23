import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/products/data/repositories/mock_product_repository.dart';
import 'package:template_catra_mobile/features/products/domain/entities/product.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>(
  (ref) => MockProductRepository(),
);

final productsControllerProvider =
    AsyncNotifierProvider<ProductsController, List<Product>>(
  ProductsController.new,
);

class ProductsController extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() {
    return ref.read(productRepositoryProvider).fetchProducts();
  }
}
