import 'package:template_catra_mobile/core/storage/token_storage.dart';
import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';
import 'package:template_catra_mobile/features/auth/domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  MockAuthRepository(this._tokenStorage);

  final TokenStorage _tokenStorage;

  @override
  Future<SessionUser> login({
    required String username,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final session = SessionUser(
      id: 1,
      username: username,
      displayName: 'Operations Lead',
      permissions: const [
        'xem-bo-phan',
        'xem-nhan-vien',
        'xem-san-pham',
        'xem-nguoi-dung',
      ],
      token: 'mock-jwt-token', 
      serialNumber: '', 
      status: '0',
    );

    await _tokenStorage.write(session.token!);
    return session;
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
      id: 1,
      username: 'demo',
      displayName: 'Operations Lead',
      permissions: const [
        'xem-bo-phan',
        'xem-nhan-vien',
        'xem-san-pham',
        'xem-nguoi-dung',
      ],
      token: token,
      serialNumber: '',
      status: '0',
    );
  }
}
