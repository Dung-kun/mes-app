import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

class ImportLotsParams {
  final String filePath;
  final bool replace;

  ImportLotsParams({
    required this.filePath,
    this.replace = false,
  });
}

class ImportLotsUseCase {
  final LotRepository repository;

  ImportLotsUseCase({required this.repository});

  Future<Result<ImportResult>> call(ImportLotsParams params) async {
    return await repository.importLots(
      filePath: params.filePath,
      replace: params.replace,
    );
  }
}
