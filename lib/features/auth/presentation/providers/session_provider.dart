import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';

// features/auth/presentation/providers/permission_providers.dart

/// Lấy session hiện tại (nullable)
final sessionUserProvider = Provider<SessionUser?>((ref) {
  return ref.watch(authControllerProvider).valueOrNull;
});

/// Có đăng nhập không
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(sessionUserProvider)?.isAuthenticated ?? false;
});

/// Check 1 permission — dùng được trong widget/router
final canProvider = Provider.family<bool, String>((ref, permission) {
  return ref.watch(sessionUserProvider)?.can(permission) ?? false;
});

/// Check 1 role
final hasRoleProvider = Provider.family<bool, String>((ref, role) {
  return ref.watch(sessionUserProvider)?.hasRole(role) ?? false;
});

/// Check nhiều permissions (canAny)
final canAnyProvider = Provider.family<bool, List<String>>((ref, perms) {
  return ref.watch(sessionUserProvider)?.canAny(perms) ?? false;
});
