import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';

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

  Future<Result<PaginatedResult<Lot>>> call(GetLotsParams params) async {
    return await repository.getLots(
      page: params.page,
      pageSize: params.pageSize,
      search: params.search,
    );
  }
}
