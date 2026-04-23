import '../entities/lot.dart';

abstract class LotRepository {
  Future<Result<List<Lot>>> getLots({
    int page = 1,
    int pageSize = 10,
    String? search,
  });

  Future<Result<Lot>> createLot({
    required String code,
    required String description,
    required String createdBy,
  });

  Future<Result<Lot>> updateLot({
    required int id,
    String? code,
    String? description,
    String? editedBy,
  });

  Future<Result<void>> deleteLot(int id);

  Future<Result<List<Lot>>> importLots({
    required String filePath,
    bool replace = false,
  });

  Future<Result<void>> downloadTemplate();
}

class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  Result.success(this.data) : error = null, isSuccess = true;
  Result.failure(this.error) : data = null, isSuccess = false;
}
