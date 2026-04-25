import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';

import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';

abstract class LotRepository {
  Future<Result<PaginatedResult<Lot>>> getLots({
    int page = 1,
    int pageSize = 10,
    String? search,
  });

  Future<Result<Lot>> createLot({
    required String code,
    required String description,
  });

  Future<Result<Lot>> updateLot({
    required int id,
    String? code,
    String? description,
    String? editedBy,
  });

  Future<Result<void>> deleteLot(int id);

  Future<Result<ImportResult>> importLots({
    required String filePath,
    bool replace = false,
  });

  Future<Result<void>> downloadTemplate();
}

