import '../entities/lot.dart';
import '../repositories/lot_repository.dart';

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

  Future<Result<List<Lot>>> call(ImportLotsParams params) async {
    return await repository.importLots(
      filePath: params.filePath,
      replace: params.replace,
    );
  }
}
