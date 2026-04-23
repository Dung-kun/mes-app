import 'package:template_catra_mobile/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}
