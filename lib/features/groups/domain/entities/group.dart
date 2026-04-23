class Group {
  const Group({
    required this.id,
    required this.code,
    required this.description,
    required this.note,
    required this.workerCount,
    this.createdBy,
    this.updatedBy,
  });

  final String id;
  final String code;
  final String description;
  final String note;
  final int workerCount;
  final String? createdBy;
  final String? updatedBy;

  Group copyWith({
    String? id,
    String? code,
    String? description,
    String? note,
    int? workerCount,
    String? createdBy,
    String? updatedBy,
  }) {
    return Group(
      id: id ?? this.id,
      code: code ?? this.code,
      description: description ?? this.description,
      note: note ?? this.note,
      workerCount: workerCount ?? this.workerCount,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
    );
  }
}
