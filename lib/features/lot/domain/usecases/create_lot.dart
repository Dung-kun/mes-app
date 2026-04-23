import '../entities/lot.dart';
import '../repositories/lot_repository.dart';

class CreateLotParams {
  final String code;
  final String description;
  final String createdBy;

  CreateLotParams({
    required this.code,
    required this.description,
    required this.createdBy,
  });
}

class CreateLotUseCase {
  final LotRepository repository;

  CreateLotUseCase({required this.repository});

  Future<Result<Lot>> call(CreateLotParams params) async {
    return await repository.createLot(
      code: params.code,
      description: params.description,
      createdBy: params.createdBy,
    );
  }
}
