import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/models/import_result.dart';
import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/core/network/api_client.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/features/lot/data/models/lot_model.dart';


abstract class LotRemoteDataSource {
  Future<Result<PaginatedResult<LotModel>>> getLots({
    int page = 1,
    int pageSize = 10,
    String? search,
  });

  Future<Result<LotModel>> createLot({
    required String code,
    required String description,
  });

  Future<Result<LotModel>> updateLot({
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

class LotRemoteDataSourceImpl implements LotRemoteDataSource {
  final Dio dio;

  LotRemoteDataSourceImpl({required this.dio});

  @override
  Future<Result<PaginatedResult<LotModel>>> getLots({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'per_page': pageSize,
      };
      
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      final response = await dio.get('/lot/pagination', queryParameters: queryParams);
      
      if (response.statusCode == 200) {
        final PaginatedResult<LotModel> result = PaginatedResult<LotModel>.fromJson(
          response.data!,
          (json) => LotModel.fromJson(json),
        );
        return Result.success(result);
      } else {
        return Result.failure('Failed to fetch lots: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error fetching lots: $e');
    }
  }

  @override
  Future<Result<LotModel>> createLot({
    required String code,
    required String description,
  }) async {
    try {
      final data = {
        'code': code,
        'description': description,
      };

      final response = await dio.post('/lot', data: data);
      
      if (response.statusCode == 201) {
        final lot = LotModel.fromJson(response.data);
        return Result.success(lot);
      } else {
        return Result.failure('Failed to create lot: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error creating lot: $e');
    }
  }

  @override
  Future<Result<LotModel>> updateLot({
    required int id,
    String? code,
    String? description,
    String? editedBy,
  }) async {
    try {
      final data = <String, dynamic>{};
      
      if (code != null) data['code'] = code;
      if (description != null) data['description'] = description;
      if (editedBy != null) data['edited_by'] = editedBy;

      final response = await dio.patch('/lot/$id', data: data);
      
      if (response.statusCode == 200) {
        final lot = LotModel.fromJson(response.data);
        return Result.success(lot);
      } else {
        return Result.failure('Failed to update lot: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error updating lot: $e');
    }
  }

  @override
  Future<Result<void>> deleteLot(int id) async {
    try {
      final response = await dio.delete('/lot/$id');
      
      if (response.statusCode == 204) {
        return Result.success(null);
      } else {
        return Result.failure('Failed to delete lot: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error deleting lot: $e');
    }
  }

  @override
  Future<Result<ImportResult>> importLots({
    required String filePath,
    bool replace = false,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
        'mode': replace ? 'replace' : 'import',
      });

      final response = await dio.post('/lot/import', data: formData);
      
      if (response.statusCode == 200) {
        final data = response.data ?? {};
        final result = ImportResult.fromJson(data);
        return Result.success(result);
      } else {
        return Result.failure('Failed to import lots: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error importing lots: $e');
    }
  }

  @override
  Future<Result<void>> downloadTemplate() async {
    try {
      final response = await dio.get('/lot/template');
      
      if (response.statusCode == 200) {
        // In a real app, you would save the file to device storage
        // For now, just return success
        return Result.success(null);
      } else {
        return Result.failure('Failed to download template: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error downloading template: $e');
    }
  }
}


final lotRemoteDataSourceProvider = Provider(
  (ref) => LotRemoteDataSourceImpl(dio: ref.watch(dioProvider)),
);
