import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

class CreateLotParams {
  final String code;
  final String description;

  CreateLotParams({
    required this.code,
    required this.description,
  });
}

class CreateLotUseCase {
  final LotRepository repository;

  CreateLotUseCase({required this.repository});

  Future<Result<void>> call(CreateLotParams params) async {
    return await repository.createLot(
      code: params.code,
      description: params.description,
    );
  }
}
