import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/data/datasources/product_remote_datasource.dart';
import 'package:template_catra_mobile/features/products/domain/entities/product.dart';
import 'package:template_catra_mobile/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<PaginatedResult<Product>>> getProducts({
    int page = 1,
    int pageSize = 10,
    String? search,
    String? parentId,
  }) async {
    final result = await remoteDataSource.getProducts(
      page: page,
      pageSize: pageSize,
      search: search,
      parentId: parentId,
    );

    if (result.isSuccess) {
      final paginatedResult = result.data!;
      final products = paginatedResult.items
          .map((model) => model.toDomain())
          .toList();
      
      debugPrint('Products: $products');
      final updatedPaginatedResult = PaginatedResult<Product>(
        items: products,
        page: paginatedResult.page,
        perPage: paginatedResult.perPage,
        total: paginatedResult.total,
      );
      
      return Result.success(updatedPaginatedResult);
    } else {
      return Result.failure(result.error);
    }
  }

  @override
  Future<Result<void>> createProduct({
    required String code,
    required String description,
    String? parentId,
    double? wWin,
    double? wMax,
    String? dinhmuc,
    String? note,
  }) async {
    return await remoteDataSource.createProduct(
      code: code,
      description: description,
      parentId: parentId,
      wWin: wWin,
      wMax: wMax,
      dinhmuc: dinhmuc,
      note: note,
    );
  }

  @override
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
  }) async {
    return await remoteDataSource.updateProduct(
      id: id,
      code: code,
      description: description,
      parentId: parentId,
      wWin: wWin,
      wMax: wMax,
      dinhmuc: dinhmuc,
      note: note,
      editedBy: editedBy,
    );
  }

  @override
  Future<Result<void>> deleteProduct(int id) async {
    return await remoteDataSource.deleteProduct(id);
  }

  @override
  Future<Result<ImportResult>> importProducts({
    required PlatformFile file,
    bool replace = false,
  }) async {
    return await remoteDataSource.importProducts(
      file: file,
      replace: replace,
    );
  }

  @override
  Future<Result<String>> downloadTemplate() async {
    return await remoteDataSource.downloadTemplate();
  }
}
