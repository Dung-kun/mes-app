import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/workers/data/data_sources/mock_worker_data_source.dart';
import 'package:template_catra_mobile/features/workers/data/data_sources/worker_data_source.dart';
import 'package:template_catra_mobile/features/workers/data/repositories/mock_worker_repository.dart';
import 'package:template_catra_mobile/features/workers/domain/entities/worker.dart';
import 'package:template_catra_mobile/features/workers/domain/repositories/worker_repository.dart';
import 'package:template_catra_mobile/features/workers/presentation/providers/worker_filters_provider.dart';

final workerDataSourceProvider = Provider<WorkerDataSource>(
  (ref) => MockWorkerDataSource(),
);

final workerRepositoryProvider = Provider<WorkerRepository>(
  (ref) => MockWorkerRepository(ref.watch(workerDataSourceProvider)),
);

final workersControllerProvider =
    AsyncNotifierProvider<WorkersController, List<Worker>>(WorkersController.new);

final workerByIdProvider = FutureProvider.family<Worker?, String>((ref, id) {
  return ref.read(workerRepositoryProvider).fetchWorkerById(id);
});

class WorkersController extends AsyncNotifier<List<Worker>> {
  @override
  Future<List<Worker>> build() {
    final filters = ref.watch(workerFiltersProvider);
    return ref.read(workerRepositoryProvider).fetchWorkers(
          query: filters.query,
          activeOnly: filters.activeOnly,
          page: filters.page,
          perPage: filters.perPage,
        );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final filters = ref.read(workerFiltersProvider);
      return ref.read(workerRepositoryProvider).fetchWorkers(
            query: filters.query,
            activeOnly: filters.activeOnly,
            page: filters.page,
            perPage: filters.perPage,
          );
    });
  }

  void search(String value) {
    ref.read(workerFiltersProvider.notifier).setQuery(value);
    ref.invalidateSelf();
  }

  void setActiveOnly(bool value) {
    ref.read(workerFiltersProvider.notifier).setActiveOnly(value);
    ref.invalidateSelf();
  }

  Future<Worker> save(Worker worker) async {
    final saved = await ref.read(workerRepositoryProvider).saveWorker(worker);
    ref.invalidate(workerByIdProvider(saved.id));
    ref.invalidateSelf();
    return saved;
  }

  Future<void> delete(String id) async {
    await ref.read(workerRepositoryProvider).deleteWorker(id);
    ref.invalidate(workerByIdProvider(id));
    ref.invalidateSelf();
  }
}
