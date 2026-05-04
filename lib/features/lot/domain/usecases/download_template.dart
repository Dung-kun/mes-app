import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

class DownloadTemplateUseCase {
  final LotRepository repository;

  DownloadTemplateUseCase({required this.repository});

  Future<Result<void>> call() async {
    return await repository.downloadTemplate();
  }
}
