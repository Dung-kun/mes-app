import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class ImportProductsParams {
  final PlatformFile file;
  final bool replace;

  ImportProductsParams({
    required this.file,
    this.replace = false,
  });
}

class ImportProductsUseCase {
  final ProductRepository repository;

  ImportProductsUseCase({required this.repository});

  Future<Result<ImportResult>> call(ImportProductsParams params) async {
    return await repository.importProducts(
      file: params.file,
      replace: params.replace,
    );
  }
}
