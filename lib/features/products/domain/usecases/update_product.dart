import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class UpdateProductParams {
  final int id;
  final String? code;
  final String? description;
  final String? parentId;
  final double? wWin;
  final double? wMax;
  final String? dinhmuc;
  final String? note;
  final String? editedBy;

  UpdateProductParams({
    required this.id,
    this.code,
    this.description,
    this.parentId,
    this.wWin,
    this.wMax,
    this.dinhmuc,
    this.note,
    this.editedBy,
  });
}

class UpdateProductUseCase {
  final ProductRepository repository;

  UpdateProductUseCase({required this.repository});

  Future<Result<void>> call(UpdateProductParams params) async {
    return await repository.updateProduct(
      id: params.id,
      code: params.code,
      description: params.description,
      parentId: params.parentId,
      wWin: params.wWin,
      wMax: params.wMax,
      dinhmuc: params.dinhmuc,
      note: params.note,
      editedBy: params.editedBy,
    );
  }
}
