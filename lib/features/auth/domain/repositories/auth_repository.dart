import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';

abstract class AuthRepository {
  Future<SessionUser?> restoreSession();
  Future<SessionUser> login({
    required String username,
    required String password,
  });
  Future<void> logout();
}
