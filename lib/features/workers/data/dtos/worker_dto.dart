import 'package:template_catra_mobile/features/workers/domain/entities/worker.dart';

class WorkerDto {
  const WorkerDto({
    required this.id,
    required this.code,
    required this.workerName,
    required this.groupCode,
    required this.groupName,
    required this.status,
    this.cardCode,
    this.note = '',
  });

  final String id;
  final String code;
  final String workerName;
  final String groupCode;
  final String groupName;
  final String status;
  final String? cardCode;
  final String note;

  factory WorkerDto.fromJson(Map<String, dynamic> json) {
    return WorkerDto(
      id: '${json['id']}',
      code: json['code'] as String? ?? '',
      workerName: json['worker_name'] as String? ?? '',
      groupCode: json['group_code'] as String? ?? '',
      groupName: json['group_name'] as String? ?? '',
      status: json['status'] as String? ?? 'inactive',
      cardCode: json['factory_id'] as String?,
      note: json['note'] as String? ?? '',
    );
  }

  Worker toDomain() {
    return Worker(
      id: id,
      code: code,
      name: workerName,
      groupCode: groupCode,
      groupName: groupName,
      status: status,
      cardCode: cardCode,
      note: note,
    );
  }

  WorkerDto copyWith({
    String? id,
    String? code,
    String? workerName,
    String? groupCode,
    String? groupName,
    String? status,
    String? cardCode,
    String? note,
  }) {
    return WorkerDto(
      id: id ?? this.id,
      code: code ?? this.code,
      workerName: workerName ?? this.workerName,
      groupCode: groupCode ?? this.groupCode,
      groupName: groupName ?? this.groupName,
      status: status ?? this.status,
      cardCode: cardCode ?? this.cardCode,
      note: note ?? this.note,
    );
  }
}
