import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class DownloadTemplateUseCase {
  final ProductRepository repository;

  DownloadTemplateUseCase({required this.repository});

  Future<Result<String>> call() async {
    return await repository.downloadTemplate();
  }
}
