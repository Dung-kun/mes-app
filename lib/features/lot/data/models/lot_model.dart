import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';

class LotModel {
  final int id;
  final String code;
  final String description;
  final String createdBy;
  final String? editedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int orderBy;

  const LotModel({
    required this.id,
    required this.code,
    required this.description,
    required this.createdBy,
    this.editedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.orderBy,
  });

  factory LotModel.fromJson(Map<String, dynamic> json) {
    return LotModel(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      createdBy: json['created_by'] ?? '',
      editedBy: json['edited_by'],
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : DateTime.now(),
      orderBy: json['order_by'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'description': description,
      'created_by': createdBy,
      'edited_by': editedBy,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'order_by': orderBy,
    };
  }

  Lot toDomain() {
    return Lot(
      id: id,
      code: code,
      description: description,
      createdBy: createdBy,
      editedBy: editedBy,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderBy: orderBy,
    );
  }

  factory LotModel.fromDomain(Lot lot) {
    return LotModel(
      id: lot.id,
      code: lot.code,
      description: lot.description,
      createdBy: lot.createdBy,
      editedBy: lot.editedBy,
      createdAt: lot.createdAt,
      updatedAt: lot.updatedAt,
      orderBy: lot.orderBy,
    );
  }

  LotModel copyWith({
    int? id,
    String? code,
    String? description,
    String? createdBy,
    String? editedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? orderBy,
  }) {
    return LotModel(
      id: id ?? this.id,
      code: code ?? this.code,
      description: description ?? this.description,
      createdBy: createdBy ?? this.createdBy,
      editedBy: editedBy ?? this.editedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      orderBy: orderBy ?? this.orderBy,
    );
  }
}
