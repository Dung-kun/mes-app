import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

class UpdateLotParams {
  final int id;
  final String? code;
  final String? description;

  UpdateLotParams({
    required this.id,
    this.code,
    this.description,
  });
}

class UpdateLotUseCase {
  final LotRepository repository;

  UpdateLotUseCase({required this.repository});

  Future<Result<void>> call(UpdateLotParams params) async {
    return await repository.updateLot(
      id: params.id,
      code: params.code,
      description: params.description,
    );
  }
}
