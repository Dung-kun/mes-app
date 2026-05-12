import 'package:template_catra_mobile/features/products/domain/entities/product.dart';

class ProductModel {
  final int id;
  final String code;
  final String description;
  final String parentId;
  final double? wWin;
  final double? wMax;
  final String? dinhmuc;
  final String? note;
  final String? objectCount;
  final String createdBy;
  final String? editedBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductModel({
    required this.id,
    required this.code,
    required this.description,
    required this.parentId,
    this.wWin,
    this.wMax,
    this.dinhmuc,
    this.note,
    this.objectCount,
    required this.createdBy,
    this.editedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      parentId: json['parent_id']?.toString() ?? '0',
      wWin: json['w_min'] != null ? double.tryParse(json['w_min'].toString()) : null,
      wMax: json['w_max'] != null ? double.tryParse(json['w_max'].toString()) : null,
      dinhmuc: json['dinhmuc'],
      note: json['note'],
      objectCount: json['object_count'] ?? '',
      createdBy: json['created_by'] ?? '',
      editedBy: json['edited_by'],
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'description': description,
      'parent_id': parentId,
      'w_win': wWin,
      'w_max': wMax,
      'dinhmuc': dinhmuc,
      'note': note,
      'object_count': objectCount,
      'created_by': createdBy,
      'edited_by': editedBy,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Product toDomain() {
    return Product(
      id: id,
      code: code,
      description: description,
      parentId: parentId,
      wWin: wWin,
      wMax: wMax,
      dinhmuc: dinhmuc,
      note: note,
      objectCount: objectCount,
      createdBy: createdBy,
      editedBy: editedBy,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory ProductModel.fromDomain(Product product) {
    return ProductModel(
      id: product.id,
      code: product.code,
      description: product.description,
      parentId: product.parentId,
      wWin: product.wWin,
      wMax: product.wMax,
      dinhmuc: product.dinhmuc,
      note: product.note,
      objectCount: product.objectCount,
      createdBy: product.createdBy,
      editedBy: product.editedBy,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
    );
  }

  ProductModel copyWith({
    int? id,
    String? code,
    String? description,
    String? parentId,
    double? wWin,
    double? wMax,
    String? dinhmuc,
    String? note,
    String? objectCount,
    String? createdBy,
    String? editedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      code: code ?? this.code,
      description: description ?? this.description,
      parentId: parentId ?? this.parentId,
      wWin: wWin ?? this.wWin,
      wMax: wMax ?? this.wMax,
      dinhmuc: dinhmuc ?? this.dinhmuc,
      note: note ?? this.note,
      objectCount: objectCount ?? this.objectCount,
      createdBy: createdBy ?? this.createdBy,
      editedBy: editedBy ?? this.editedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
