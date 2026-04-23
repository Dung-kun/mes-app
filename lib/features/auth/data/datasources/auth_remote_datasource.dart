import 'package:dio/dio.dart';
import 'package:template_catra_mobile/features/auth/data/models/user_model.dart';
import 'package:template_catra_mobile/features/lot/domain/repositories/lot_repository.dart';


const loginEndpoint = '/login-remote';
const createUserEndpoint = '/user';
const updateUserEndpoint = '/user';
const deleteUserEndpoint = '/user';   
abstract class AuthDataSource {
  Future<Result<UserModel>> login({
    required String username,
    required String password,
  });

  Future<Result<UserModel>> createUser({
    required String name,
    required String password,
  });

  Future<Result<UserModel>> updateUser({
    required int id,
    String? name,
    String? password,
  });

  Future<Result<void>> deleteUser(int id);

}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio;

  AuthDataSourceImpl({required this.dio});

  @override
  Future<Result<UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'username': username,
        'password': password,
      };
      

      final response = await dio.get(loginEndpoint, queryParameters: queryParams);
      
      if (response.statusCode == 200) {
        final data = response.data['data'];
        final user = UserModel.fromJson(data);
        return Result.success(user);
      } else {
        return Result.failure('Failed to fetch lots: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error fetching lots: $e');
    }
  }

  @override
  Future<Result<UserModel>> createUser({
    required String name,
    required String password,
  }) async {
    try {
      final data = {
        'name': name,
        'password': password,
      };

      final response = await dio.post(createUserEndpoint, data: data);
      
      if (response.statusCode == 201) {
        final user = UserModel.fromJson(response.data['data']);
        return Result.success(user);
      } else {
        return Result.failure('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error creating user: $e');
    }
  }

  @override
  Future<Result<UserModel>> updateUser({
    required int id,
    String? name,
    String? password,
  }) async {
    try {
      final data = <String, dynamic>{};
      
      if (name != null) data['name'] = name;
      if (password != null) data['password'] = password;

      final response = await dio.patch('$updateUserEndpoint/$id', data: data);
      
      if (response.statusCode == 200) {
        final user = UserModel.fromJson(response.data['data']);
        return Result.success(user);
      } else {
        return Result.failure('Failed to update user: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error updating user: $e');
    }
  }

  @override
  Future<Result<void>> deleteUser(int id) async {
    try {
      final response = await dio.delete('$deleteUserEndpoint/$id');
      
      if (response.statusCode == 204) {
        return Result.success(null);
      } else {
        return Result.failure('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      return Result.failure('Error deleting user: $e');
    }
  }
}
