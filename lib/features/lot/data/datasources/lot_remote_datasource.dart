import 'package:dio/dio.dart';
import 'package:template_catra_mobile/features/lot/data/models/lot_model.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';


abstract class LotRemoteDataSource {
  Future<Result<List<LotModel>>> getLots({
    int page = 1,
    int pageSize = 10,
    String? search,
  });

  Future<Result<LotModel>> createLot({
    required String code,
    required String description,
    required String createdBy,
  });

  Future<Result<LotModel>> updateLot({
    required int id,
    String? code,
    String? description,
    String? editedBy,
  });

  Future<Result<void>> deleteLot(int id);

  Future<Result<List<LotModel>>> importLots({
    required String filePath,
    bool replace = false,
  });

  Future<Result<void>> downloadTemplate();
}

class LotRemoteDataSourceImpl implements LotRemoteDataSource {
  final Dio dio;

  LotRemoteDataSourceImpl({required this.dio});

  @override
  Future<Result<List<LotModel>>> getLots({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
      };
      
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      final response = await dio.get('/lot', queryParameters: queryParams);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        final lots = data.map((json) => LotModel.fromJson(json)).toList();
        return Result.success(lots);
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
    required String createdBy,
  }) async {
    try {
      final data = {
        'code': code,
        'description': description,
        'created_by': createdBy,
      };

      final response = await dio.post('/lot', data: data);
      
      if (response.statusCode == 201) {
        final lot = LotModel.fromJson(response.data['data']);
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
        final lot = LotModel.fromJson(response.data['data']);
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
  Future<Result<List<LotModel>>> importLots({
    required String filePath,
    bool replace = false,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
        'replace': replace,
      });

      final response = await dio.post('/lot/import', data: formData);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        final lots = data.map((json) => LotModel.fromJson(json)).toList();
        return Result.success(lots);
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
