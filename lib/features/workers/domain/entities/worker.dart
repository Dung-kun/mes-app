class Worker {
  const Worker({
    required this.id,
    required this.code,
    required this.name,
    required this.groupCode,
    required this.groupName,
    required this.status,
    this.cardCode,
    this.note = '',
  });

  final String id;
  final String code;
  final String name;
  final String groupCode;
  final String groupName;
  final String status;
  final String? cardCode;
  final String note;

  bool get isActive => status == 'active';

  Worker copyWith({
    String? id,
    String? code,
    String? name,
    String? groupCode,
    String? groupName,
    String? status,
    String? cardCode,
    String? note,
  }) {
    return Worker(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      groupCode: groupCode ?? this.groupCode,
      groupName: groupName ?? this.groupName,
      status: status ?? this.status,
      cardCode: cardCode ?? this.cardCode,
      note: note ?? this.note,
    );
  }
}
