import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/features/workers/data/dtos/worker_dto.dart';

abstract class WorkerDataSource {
  Future<PaginatedResult<WorkerDto>> fetchWorkers({
    String query = '',
    bool activeOnly = false,
    int page = 1,
    int perPage = 20,
  });

  Future<WorkerDto?> fetchWorkerById(String id);
  Future<WorkerDto> saveWorker(WorkerDto worker);
  Future<void> deleteWorker(String id);
}
