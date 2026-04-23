class Lot {
  final int id;
  final String code;
  final String description;
  final String createdBy;
  final String? editedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int orderBy;

  const Lot({
    required this.id,
    required this.code,
    required this.description,
    required this.createdBy,
    this.editedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.orderBy,
  });

  List<Object?> get props => [
        id,
        code,
        description,
        createdBy,
        editedBy,
        createdAt,
        updatedAt,
        orderBy,
      ];

  Lot copyWith({
    int? id,
    String? code,
    String? description,
    String? createdBy,
    String? editedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? orderBy,
  }) {
    return Lot(
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

  @override
  String toString() {
    return 'Lot(id: $id, code: $code, description: $description, createdBy: $createdBy, editedBy: $editedBy, createdAt: $createdAt, updatedAt: $updatedAt, orderBy: $orderBy)';
  }
}
