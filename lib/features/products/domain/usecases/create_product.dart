import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class CreateProductParams {
  final String code;
  final String description;
  final String? parentId;
  final double? wWin;
  final double? wMax;
  final String? dinhmuc;
  final String? note;

  CreateProductParams({
    required this.code,
    required this.description,
    this.parentId,
    this.wWin,
    this.wMax,
    this.dinhmuc,
    this.note,
  });
}

class CreateProductUseCase {
  final ProductRepository repository;

  CreateProductUseCase({required this.repository});

  Future<Result<void>> call(CreateProductParams params) async {
    return await repository.createProduct(
      code: params.code,
      description: params.description,
      parentId: params.parentId,
      wWin: params.wWin,
      wMax: params.wMax,
      dinhmuc: params.dinhmuc,
      note: params.note,
    );
  }
}
