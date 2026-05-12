import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class DeleteProductParams {
  final int id;

  DeleteProductParams({required this.id});
}

class DeleteProductUseCase {
  final ProductRepository repository;

  DeleteProductUseCase({required this.repository});

  Future<Result<void>> call(DeleteProductParams params) async {
    return await repository.deleteProduct(params.id);
  }
}
