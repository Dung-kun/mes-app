class Profile {
  const Profile({
    required this.id,
    required this.displayName,
    required this.username,
    required this.permissions,
  });

  final String id;
  final String displayName;
  final String username;
  final List<String> permissions;
}
