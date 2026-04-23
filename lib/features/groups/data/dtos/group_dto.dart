import 'package:template_catra_mobile/features/groups/domain/entities/group.dart';

class GroupDto {
  const GroupDto({
    required this.id,
    required this.code,
    required this.description,
    required this.note,
    required this.workersCount,
    this.createdBy,
    this.updatedBy,
  });

  final String id;
  final String code;
  final String description;
  final String note;
  final int workersCount;
  final String? createdBy;
  final String? updatedBy;

  factory GroupDto.fromJson(Map<String, dynamic> json) {
    return GroupDto(
      id: '${json['id']}',
      code: json['code'] as String? ?? '',
      description: json['description'] as String? ?? '',
      note: json['note'] as String? ?? '',
      workersCount: (json['workers_count'] as num?)?.toInt() ?? 0,
      createdBy: json['created_by'] as String?,
      updatedBy: json['edited_by'] as String? ?? json['updated_by'] as String?,
    );
  }

  Group toDomain() {
    return Group(
      id: id,
      code: code,
      description: description,
      note: note,
      workerCount: workersCount,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }

  GroupDto copyWith({
    String? id,
    String? code,
    String? description,
    String? note,
    int? workersCount,
    String? createdBy,
    String? updatedBy,
  }) {
    return GroupDto(
      id: id ?? this.id,
      code: code ?? this.code,
      description: description ?? this.description,
      note: note ?? this.note,
      workersCount: workersCount ?? this.workersCount,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
    );
  }
}
