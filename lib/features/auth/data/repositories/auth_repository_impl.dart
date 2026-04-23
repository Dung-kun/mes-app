import 'package:template_catra_mobile/core/storage/token_storage.dart';
import 'package:template_catra_mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';
import 'package:template_catra_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._tokenStorage, this._authRemoteDataSource);

  final TokenStorage _tokenStorage;
  final AuthDataSource _authRemoteDataSource;

  @override
  Future<SessionUser> login({
    required String username,
    required String password,
  }) async {
    final result = await _authRemoteDataSource.login(username: username, password: password);
    if (result.isSuccess) {
      throw result.error!;
    }
    final user = result.data!;
    await _tokenStorage.write(user.token!);
    return user.toDomain();
  }

  @override
  Future<void> logout() => _tokenStorage.clear();

  @override
  Future<SessionUser?> restoreSession() async {
    final token = await _tokenStorage.read();
    if (token == null || token.isEmpty) {
      return null;
    }

    return SessionUser(
      id: '1',
      username: 'demo',
      displayName: 'Operations Lead',
      permissions: const [
        'xem-bo-phan',
        'xem-nhan-vien',
        'xem-san-pham',
        'xem-nguoi-dung',
      ],
      token: token,
      status: 'active',
    );
  }
}
