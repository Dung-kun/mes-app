import '../entities/lot.dart';
import '../repositories/lot_repository.dart';

class GetLotsParams {
  final int page;
  final int pageSize;
  final String? search;

  GetLotsParams({
    this.page = 1,
    this.pageSize = 10,
    this.search,
  });
}

class GetLotsUseCase {
  final LotRepository repository;

  GetLotsUseCase({required this.repository});

  Future<Result<List<Lot>>> call(GetLotsParams params) async {
    return await repository.getLots(
      page: params.page,
      pageSize: params.pageSize,
      search: params.search,
    );
  }
}
