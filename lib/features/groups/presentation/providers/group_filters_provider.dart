import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupFilters {
  const GroupFilters({
    this.query = '',
    this.page = 1,
    this.perPage = 20,
  });

  final String query;
  final int page;
  final int perPage;

  GroupFilters copyWith({
    String? query,
    int? page,
    int? perPage,
  }) {
    return GroupFilters(
      query: query ?? this.query,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}

class GroupFiltersNotifier extends Notifier<GroupFilters> {
  @override
  GroupFilters build() => const GroupFilters();

  void setQuery(String value) {
    state = state.copyWith(query: value, page: 1);
  }
}

final groupFiltersProvider =
    NotifierProvider<GroupFiltersNotifier, GroupFilters>(GroupFiltersNotifier.new);
