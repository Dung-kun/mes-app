import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';

final currentSessionProvider = Provider<SessionUser?>(
  (ref) => ref.watch(authControllerProvider).valueOrNull,
);

final isAuthenticatedProvider = Provider<bool>(
  (ref) => ref.watch(currentSessionProvider)?.isAuthenticated ?? false,
);

final permissionSetProvider = Provider<Set<String>>(
  (ref) => {...?ref.watch(currentSessionProvider)?.permissions},
);

final canManageUsersProvider = Provider<bool>(
  (ref) => ref.watch(permissionSetProvider).contains('xem-nguoi-dung'),
);
