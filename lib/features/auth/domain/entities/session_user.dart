class SessionUser {
  const SessionUser({
    required this.id,
    required this.username,
    required this.displayName,
    required this.permissions,
   this.serialNumber,
    required this.status,
    this.token,
  });

  final int id;
  final String username;
  final String displayName;
  final List<String> permissions;
  final String? serialNumber;
  final String status;
  final String? token;

  SessionUser copyWith({
  int? id,
  String? username,
  String? displayName,
  List<String>? permissions,
  String? serialNumber,
  String? status,
  String? token,
}) {
  return SessionUser(
    id: id ?? this.id,
    username: username ?? this.username,
    displayName: displayName ?? this.displayName,
    permissions: permissions ?? this.permissions,
    serialNumber: serialNumber ?? this.serialNumber,
    status: status ?? this.status,
    token: token ?? this.token,
  );
}  
  bool get isAuthenticated => token != null && token!.isNotEmpty;
}
