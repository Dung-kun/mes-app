import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/data/datasources/lot_remote_datasource.dart';
import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

class LotRepositoryImpl implements LotRepository {
  final LotRemoteDataSource remoteDataSource;

  LotRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<PaginatedResult<Lot>>> getLots({
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
      final PaginatedResult<Lot> lots = result.data!.toDomain((model) => model.toDomain());
      return Result.success(lots);
    } else {
      return Result.failure(result.error ?? 'Unknown error');
    }
  }

  @override
  Future<Result<void>> createLot({
    required String code,
    required String description,
  }) async {
    final result = await remoteDataSource.createLot(
      code: code,
      description: description,
    );

    return result;
  }

  @override
  Future<Result<void>> updateLot({
    required int id,
    String? code,
    String? description,
  }) async {
    final result = await remoteDataSource.updateLot(
      id: id,
      code: code,
      description: description,
    );

    return result;
  }

  @override
  Future<Result<void>> deleteLot(int id) async {
    return await remoteDataSource.deleteLot(id);
  }

  @override
  Future<Result<ImportResult>> importLots({
    required PlatformFile file,
    bool replace = false,
  }) async {
    final result = await remoteDataSource.importLots(
      file: file,
      replace: replace,
    );

    if (result.isSuccess && result.data != null) {
      return Result.success(result.data!);
    } else {
      return Result.failure(result.error ?? 'Unknown error');
    }
  }

  @override
  Future<Result<void>> downloadTemplate() async {
    return await remoteDataSource.downloadTemplate();
  }

  
}
