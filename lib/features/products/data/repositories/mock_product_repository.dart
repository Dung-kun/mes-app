import 'package:template_catra_mobile/features/products/domain/entities/product.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class MockProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return const [
      Product(id: '1', code: 'P-001', description: 'Premium fillet pack', note: 'Top seller'),
      Product(id: '2', code: 'P-002', description: 'Frozen export tray', note: 'Cold chain'),
      Product(id: '3', code: 'P-003', description: 'Processing basket set', note: 'Reusable'),
    ];
  }
}
