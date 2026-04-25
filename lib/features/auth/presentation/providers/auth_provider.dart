import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/storage/token_storage.dart';
import 'package:template_catra_mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:template_catra_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';
import 'package:template_catra_mobile/features/auth/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(tokenStorageProvider), ref.watch(authDataSourceProvider)),
);

final authControllerProvider =
    AsyncNotifierProvider<AuthController, SessionUser?>(AuthController.new);

class AuthController extends AsyncNotifier<SessionUser?> {
  @override
  Future<SessionUser?> build() {
    return ref.read(authRepositoryProvider).restoreSession();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    debugPrint('🔄 login() called');
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).login(
            username: username,
            password: password,
          ),
    );
    debugPrint('✅ state after login: $state');
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }
}
