import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/network/api_client.dart';
import 'package:template_catra_mobile/core/utils/api_error_helper.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/products/data/models/product_model.dart';

const String productAPI = '/product';

abstract class ProductRemoteDataSource {
  Future<Result<PaginatedResult<ProductModel>>> getProducts({
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

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<Result<PaginatedResult<ProductModel>>> getProducts({
    int page = 1,
    int pageSize = 10,
    String? search,
    String? parentId,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'per_page': pageSize,
      };

      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      if (parentId != null) {
        queryParams['parent_id'] = parentId;
      }
      final response = await dio.get(
        '$productAPI/paginated',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        final data = response.data ?? {};
        final paginatedResult = PaginatedResult<ProductModel>.fromJson(
          data,
          (itemJson) => ProductModel.fromJson(itemJson),
        );

        return Result.success(paginatedResult);
      } else {
        return Result.failure('Failed to fetch products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return handleApiError(e);
    } catch (e) {
      return Result.failure('Lấy danh sách sản phẩm thất bại: $e');
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
    try {
      final data = {
        'code': code,
        'description': description,
        'parent_id': parentId ?? '0',
        if (wWin != null) 'w_win': wWin,
        if (wMax != null) 'w_max': wMax,
        if (dinhmuc != null) 'dinhmuc': dinhmuc,
        if (note != null) 'note': note,
      };

      final response = await dio.post(productAPI, data: data);
      
      if (response.statusCode == 201) {
        return Result.success(null);
      } else {
        return Result.failure('Failed to create product: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return handleApiError(e);
    } catch (e) {
      return Result.failure('Tạo sản phẩm thất bại: $e');
    }
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
    try {
      final data = <String, dynamic>{};
      
      if (code != null) data['code'] = code;
      if (description != null) data['description'] = description;
      if (parentId != null) data['parent_id'] = parentId;
      if (wWin != null) data['w_win'] = wWin;
      if (wMax != null) data['w_max'] = wMax;
      if (dinhmuc != null) data['dinhmuc'] = dinhmuc;
      if (note != null) data['note'] = note;
      if (editedBy != null) data['edited_by'] = editedBy;

      final response = await dio.patch('$productAPI/$id', data: data);
      
      if (response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Failed to update product: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return handleApiError(e);
    } catch (e) {
      return Result.failure('Cập nhật sản phẩm thất bại: $e');
    }
  }

  @override
  Future<Result<void>> deleteProduct(int id) async {
    try {
      final response = await dio.delete('$productAPI/$id');
      
      if (response.statusCode == 204 || response.statusCode == 200) {
        return Result.success(null);
      } else {
        return Result.failure('Failed to delete product: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return handleApiError(e);
    } catch (e) {
      return Result.failure('Xóa sản phẩm thất bại: $e');
    }
  }

  @override
  Future<Result<ImportResult>> importProducts({
    required PlatformFile file,
    bool replace = false,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path!),
        'mode': replace ? 'replace' : 'import',
      });

      final response = await dio.post('$productAPI/import', data: formData);
      
      if (response.statusCode == 200) {
        final data = response.data ?? {};
        final result = ImportResult.fromJson(data);
        return Result.success(result);
      } else {
        return Result.failure('Failed to import products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return handleApiError(e);
    } catch (e) {
      return Result.failure('Nhập sản phẩm thất bại: $e');
    }
  }

  @override
  Future<Result<String>> downloadTemplate() async {
    try {
      final response = await dio.get('$productAPI/export',
        options: Options(
          responseType: ResponseType.bytes,
          headers: {'Accept': '*/*'},
      ));
      
      if (response.statusCode == 200) {
        final headers = response.headers;
        final disposition = headers.value('content-disposition');

        String filename = 'export.xlsx'; 
        if (disposition != null && disposition.contains('filename=')) {
          filename = disposition
              .split('filename=')
              .last
              .replaceAll('"', '')
              .trim();

            final savePath = await FilePicker.platform.saveFile(
              dialogTitle: 'Lưu file Excel',
              fileName: filename,
              allowedExtensions: ['xlsx', 'xls'],
              type: FileType.custom,
              bytes: Uint8List.fromList(response.data), // ← truyền bytes vào luôn
            );

            if (savePath == null) Result.success(null); // user cancel

            // 3. Một số platform cần tự ghi (Android/iOS)
            final file = File(savePath!);
            await file.writeAsBytes(response.data);
           return Result.success(savePath);
        } else {
            return Result.failure('Failed to download template: ${response.statusCode}');
        }
      } else {
        return Result.failure('Failed to download template: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return handleApiError(e);
    } catch (e) {
      return Result.failure('Tải template thất bại: $e');
    }
  }
}

final productRemoteDataSourceProvider = Provider(
  (ref) => ProductRemoteDataSourceImpl(dio: ref.watch(dioProvider)),
);
