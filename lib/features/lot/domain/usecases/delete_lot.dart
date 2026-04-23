import '../repositories/lot_repository.dart';

class DeleteLotUseCase {
  final LotRepository repository;

  DeleteLotUseCase({required this.repository});

  Future<Result<void>> call(int id) async {
    return await repository.deleteLot(id);
  }
}
