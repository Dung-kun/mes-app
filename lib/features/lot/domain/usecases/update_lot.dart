import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

class UpdateLotParams {
  final int id;
  final String? code;
  final String? description;
  final String? editedBy;

  UpdateLotParams({
    required this.id,
    this.code,
    this.description,
    this.editedBy,
  });
}

class UpdateLotUseCase {
  final LotRepository repository;

  UpdateLotUseCase({required this.repository});

  Future<Result<Lot>> call(UpdateLotParams params) async {
    return await repository.updateLot(
      id: params.id,
      code: params.code,
      description: params.description,
      editedBy: params.editedBy,
    );
  }
}
