// features/auth/domain/entities/session_user.dart

class SessionUser {
  const SessionUser({
    required this.id,
    required this.username,
    required this.displayName,
    required this.permissions,
    this.serialNumber,
    required this.status,
    this.token,
    this.roles = const [],  // 👈 thêm roles
  });

  final int id;
  final String username;
  final String displayName;
  final List<String> permissions;
  final List<String> roles;       // 👈 thêm roles
  final String? serialNumber;
  final String status;
  final String? token;

  // ─── Permission Helpers ───────────────────────────────────────

  /// Có permission cụ thể không
  bool can(String permission) => permissions.contains(permission);

  /// Không có permission
  bool cannot(String permission) => !can(permission);

  /// Có ít nhất 1 trong danh sách
  bool canAny(List<String> perms) => perms.any(permissions.contains);

  /// Phải có tất cả
  bool canAll(List<String> perms) => perms.every(permissions.contains);

  // ─── Role Helpers ─────────────────────────────────────────────

  bool hasRole(String role) => roles.contains(role);
  bool hasAnyRole(List<String> r) => r.any(roles.contains);
  bool hasAllRoles(List<String> r) => r.every(roles.contains);

  // ─── Auth State ───────────────────────────────────────────────

  bool get isAuthenticated => token != null && token!.isNotEmpty;

  // ─── copyWith & các thứ cũ giữ nguyên ─────────────────────────

  SessionUser copyWith({
    int? id,
    String? username,
    String? displayName,
    List<String>? permissions,
    List<String>? roles,
    String? serialNumber,
    String? status,
    String? token,
  }) {
    return SessionUser(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      permissions: permissions ?? this.permissions,
      roles: roles ?? this.roles,
      serialNumber: serialNumber ?? this.serialNumber,
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}