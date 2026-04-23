import 'package:template_catra_mobile/features/workers/data/data_sources/worker_data_source.dart';
import 'package:template_catra_mobile/features/workers/data/dtos/worker_dto.dart';
import 'package:template_catra_mobile/features/workers/domain/entities/worker.dart';
import 'package:template_catra_mobile/features/workers/domain/repositories/worker_repository.dart';

class MockWorkerRepository implements WorkerRepository {
  MockWorkerRepository(this._dataSource);

  final WorkerDataSource _dataSource;

  @override
  Future<Worker?> fetchWorkerById(String id) async {
    final dto = await _dataSource.fetchWorkerById(id);
    return dto?.toDomain();
  }

  @override
  Future<List<Worker>> fetchWorkers({
    String query = '',
    bool activeOnly = false,
    int page = 1,
    int perPage = 20,
  }) async {
    final result = await _dataSource.fetchWorkers(
      query: query,
      activeOnly: activeOnly,
      page: page,
      perPage: perPage,
    );

    return result.items.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> deleteWorker(String id) {
    return _dataSource.deleteWorker(id);
  }

  @override
  Future<Worker> saveWorker(Worker worker) async {
    final dto = WorkerDto(
      id: worker.id,
      code: worker.code,
      workerName: worker.name,
      groupCode: worker.groupCode,
      groupName: worker.groupName,
      status: worker.status,
      cardCode: worker.cardCode?.isEmpty == true ? null : worker.cardCode,
      note: worker.note,
    );

    final saved = await _dataSource.saveWorker(dto);
    return saved.toDomain();
  }
}
