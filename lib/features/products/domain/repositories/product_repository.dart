import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';

import 'package:template_catra_mobile/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Result<PaginatedResult<Product>>> getProducts({
    int page = 1,
    int pageSize = 10,
    String? search,
    String? parentId,
  });

  Future<Result<void>> createProduct({
    required String code,
    required String description,
    String? parentId,
    double? wWin,
    double? wMax,
    String? dinhmuc,
    String? note,
  });

  Future<Result<void>> updateProduct({
    required int id,
    String? code,
    String? description,
    String? parentId,
    double? wWin,
    double? wMax,
    String? dinhmuc,
    String? note,
    String? editedBy,
  });

  Future<Result<void>> deleteProduct(int id);

  Future<Result<ImportResult>> importProducts({
    required PlatformFile file,
    bool replace = false,
  });

  Future<Result<String>> downloadTemplate();
}
