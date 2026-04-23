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

  final String id;
  final String username;
  final String displayName;
  final List<String> permissions;
  final String? serialNumber;
  final String status;
  final String? token;

  bool get isAuthenticated => token != null && token!.isNotEmpty;
}
