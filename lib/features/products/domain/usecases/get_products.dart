import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/domain/entities/product.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class GetProductsParams {
  final int page;
  final int pageSize;
  final String? search;
  final String? parentId;

  GetProductsParams({
    this.page = 1,
    this.pageSize = 10,
    this.search,
    this.parentId,
  });
}

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<Result<PaginatedResult<Product>>> call(GetProductsParams params) async {
    return await repository.getProducts(
      page: params.page,
      pageSize: params.pageSize,
      search: params.search,
      parentId: params.parentId,
    );
  }
}
