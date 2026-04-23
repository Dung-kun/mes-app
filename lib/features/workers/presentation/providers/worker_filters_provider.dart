import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkerFilters {
  const WorkerFilters({
    this.query = '',
    this.activeOnly = true,
    this.page = 1,
    this.perPage = 20,
  });

  final String query;
  final bool activeOnly;
  final int page;
  final int perPage;

  WorkerFilters copyWith({
    String? query,
    bool? activeOnly,
    int? page,
    int? perPage,
  }) {
    return WorkerFilters(
      query: query ?? this.query,
      activeOnly: activeOnly ?? this.activeOnly,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}

class WorkerFiltersNotifier extends Notifier<WorkerFilters> {
  @override
  WorkerFilters build() => const WorkerFilters();

  void setQuery(String value) {
    state = state.copyWith(query: value, page: 1);
  }

  void setActiveOnly(bool value) {
    state = state.copyWith(activeOnly: value, page: 1);
  }
}

final workerFiltersProvider =
    NotifierProvider<WorkerFiltersNotifier, WorkerFilters>(WorkerFiltersNotifier.new);
