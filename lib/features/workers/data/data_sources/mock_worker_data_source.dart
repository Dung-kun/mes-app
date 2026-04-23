import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/features/workers/data/data_sources/worker_data_source.dart';
import 'package:template_catra_mobile/features/workers/data/dtos/worker_dto.dart';

class MockWorkerDataSource implements WorkerDataSource {
  static final List<WorkerDto> _items = [
    WorkerDto(
      id: '1',
      code: 'W0001',
      workerName: 'Nguyen Van A',
      groupCode: 'GR-A1',
      groupName: 'Receiving line A1',
      status: 'active',
      cardCode: 'RF-1029',
      note: 'Forklift certified',
    ),
    WorkerDto(
      id: '2',
      code: 'W0002',
      workerName: 'Tran Thi B',
      groupCode: 'GR-FL',
      groupName: 'Fillet operations',
      status: 'active',
      cardCode: 'RF-2011',
      note: 'Shift leader',
    ),
    WorkerDto(
      id: '3',
      code: 'W0003',
      workerName: 'Le Van C',
      groupCode: 'GR-QC',
      groupName: 'Quality control',
      status: 'inactive',
      note: 'On leave',
    ),
    WorkerDto(
      id: '4',
      code: 'W0004',
      workerName: 'Pham Thi D',
      groupCode: 'GR-PKG',
      groupName: 'Packing shift',
      status: 'active',
      cardCode: 'RF-8871',
      note: 'Label verification',
    ),
    WorkerDto(
      id: '5',
      code: 'W0005',
      workerName: 'Hoang Van E',
      groupCode: 'GR-FL',
      groupName: 'Fillet operations',
      status: 'active',
      note: 'No card assigned',
    ),
  ];

  @override
  Future<WorkerDto?> fetchWorkerById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteWorker(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _items.removeWhere((item) => item.id == id);
  }

  @override
  Future<PaginatedResult<WorkerDto>> fetchWorkers({
    String query = '',
    bool activeOnly = false,
    int page = 1,
    int perPage = 20,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    final normalizedQuery = query.trim().toLowerCase();
    final filtered = _items.where((item) {
      final matchesQuery = normalizedQuery.isEmpty ||
          item.code.toLowerCase().contains(normalizedQuery) ||
          item.workerName.toLowerCase().contains(normalizedQuery) ||
          item.groupName.toLowerCase().contains(normalizedQuery);

      final matchesStatus = !activeOnly || item.status == 'active';
      return matchesQuery && matchesStatus;
    }).toList();

    final start = (page - 1) * perPage;
    final end = (start + perPage).clamp(0, filtered.length);
    final slice = start >= filtered.length ? <WorkerDto>[] : filtered.sublist(start, end);

    return PaginatedResult(
      items: slice,
      page: page,
      perPage: perPage,
      total: filtered.length,
    );
  }

  @override
  Future<WorkerDto> saveWorker(WorkerDto worker) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    final index = _items.indexWhere((item) => item.id == worker.id);
    if (index >= 0) {
      _items[index] = worker;
      return worker;
    }

    final next = worker.copyWith(id: (_items.length + 1).toString());
    _items.add(next);
    return next;
  }
}
