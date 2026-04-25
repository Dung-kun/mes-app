import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';

class UserModel {
  final int id;
  final String username;
  final String name;
  final String? serialNumber;
  final String? password;
  final String? token;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserModel({
    required this.id,
    required this.username,
    required this.name,
    this.serialNumber,
    this.password,
    this.token,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final token = json['token'] ?? '';
    final data = json['user'] ?? {};
    return UserModel(
      id: data['id'] ?? 0,
      username: data['username'] ?? '',
      name: data['name'] ?? '',
      serialNumber: data['serial_number'] ?? '',
      password: '',
      token: token,
      status: data['status'] ?? '',
      createdAt: data['created_at'] != null 
          ? DateTime.parse(data['created_at']) 
          : DateTime.now(),
      updatedAt: data['updated_at'] != null 
          ? DateTime.parse(data['updated_at']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'serial_number': serialNumber,
      'password': password,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  SessionUser toDomain() {
    return SessionUser(
      id: id,
      username: username,
      displayName: name, 
      permissions: [],
      serialNumber: serialNumber ?? '',
      status: status,
      token: token,
      // createdAt: createdAt,
      // updatedAt: updatedAt,
    );
  }

  factory UserModel.fromDomain(SessionUser sessionUser) {
    return UserModel(
      id: sessionUser.id,
      username: sessionUser.username,
      name: sessionUser.displayName,
      serialNumber: sessionUser.serialNumber ?? '',
      password: '',  // Password is not stored in session user
      token: sessionUser.token, // Token is not stored in session user
      status: sessionUser.status,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  UserModel copyWith({
    int? id,
    String? username,
    String? name,
    String? serialNumber,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      serialNumber: serialNumber ?? this.serialNumber,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      password: password ?? '',
      token: token ??  '',
    );
  }
}
