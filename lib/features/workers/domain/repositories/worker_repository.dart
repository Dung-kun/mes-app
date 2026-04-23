import 'package:template_catra_mobile/features/workers/domain/entities/worker.dart';

abstract class WorkerRepository {
  Future<List<Worker>> fetchWorkers({
    String query = '',
    bool activeOnly = false,
    int page = 1,
    int perPage = 20,
  });

  Future<Worker?> fetchWorkerById(String id);
  Future<Worker> saveWorker(Worker worker);
  Future<void> deleteWorker(String id);
}
