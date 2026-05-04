import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

class ImportLotsParams {
  final PlatformFile file;
  final bool replace;

  ImportLotsParams({
    required this.file,
    this.replace = false,
  });
}

class ImportLotsUseCase {
  final LotRepository repository;

  ImportLotsUseCase({required this.repository});

  Future<Result<ImportResult>> call(ImportLotsParams params) async {
    return await repository.importLots(
      file: params.file,
      replace: params.replace,
    );
  }
}
