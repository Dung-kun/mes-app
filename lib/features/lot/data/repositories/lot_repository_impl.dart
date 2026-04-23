import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';
import 'package:template_catra_mobile/features/lot/data/datasources/lot_remote_datasource.dart';
import 'package:template_catra_mobile/features/lot/data/models/lot_model.dart';

class LotRepositoryImpl implements LotRepository {
  final LotRemoteDataSource remoteDataSource;

  LotRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<List<Lot>>> getLots({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    final result = await remoteDataSource.getLots(
      page: page,
      pageSize: pageSize,
      search: search,
    );

    if (result.isSuccess && result.data != null) {
      final lots = result.data!.map((model) => model.toDomain()).toList();
      return Result.success(lots);
    } else {
      return Result.failure(result.error ?? 'Unknown error');
    }
  }

  @override
  Future<Result<Lot>> createLot({
    required String code,
    required String description,
    required String createdBy,
  }) async {
    final result = await remoteDataSource.createLot(
      code: code,
      description: description,
      createdBy: createdBy,
    );

    if (result.isSuccess && result.data != null) {
      return Result.success(result.data!.toDomain());
    } else {
      return Result.failure(result.error ?? 'Unknown error');
    }
  }

  @override
  Future<Result<Lot>> updateLot({
    required int id,
    String? code,
    String? description,
    String? editedBy,
  }) async {
    final result = await remoteDataSource.updateLot(
      id: id,
      code: code,
      description: description,
      editedBy: editedBy,
    );

    if (result.isSuccess && result.data != null) {
      return Result.success(result.data!.toDomain());
    } else {
      return Result.failure(result.error ?? 'Unknown error');
    }
  }

  @override
  Future<Result<void>> deleteLot(int id) async {
    return await remoteDataSource.deleteLot(id);
  }

  @override
  Future<Result<List<Lot>>> importLots({
    required String filePath,
    bool replace = false,
  }) async {
    final result = await remoteDataSource.importLots(
      filePath: filePath,
      replace: replace,
    );

    if (result.isSuccess && result.data != null) {
      final lots = result.data!.map((model) => model.toDomain()).toList();
      return Result.success(lots);
    } else {
      return Result.failure(result.error ?? 'Unknown error');
    }
  }

  @override
  Future<Result<void>> downloadTemplate() async {
    return await remoteDataSource.downloadTemplate();
  }
}
