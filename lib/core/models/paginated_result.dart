class PaginatedResult<T> {
  const PaginatedResult({
    required this.items,
    required this.page,
    required this.perPage,
    required this.total,
  });

  final List<T> items;
  final int page;
  final int perPage;
  final int total;

  factory PaginatedResult.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    final original = json['original'] as Map<String, dynamic>;
    final data = original['data'] as List<dynamic>;
    final meta = original['meta'] as Map<String, dynamic>;

    return PaginatedResult<T>(
      items: data
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      page: meta['current_page'] as int,
      perPage: meta['per_page'] as int,
      total: meta['total'] as int,
    );
  }

  PaginatedResult<R> toDomain<R>(
    R Function(T item) mapper,
  ) {
    return PaginatedResult<R>(
      items: items.map(mapper).toList(),
      page: page,
      perPage: perPage,
      total: total,
    );
  }
}