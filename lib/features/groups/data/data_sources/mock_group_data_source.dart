import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/features/groups/data/data_sources/group_data_source.dart';
import 'package:template_catra_mobile/features/groups/data/dtos/group_dto.dart';

class MockGroupDataSource implements GroupDataSource {
  static final List<GroupDto> _items = [
    GroupDto(
      id: '1',
      code: 'GR-A1',
      description: 'Receiving line A1',
      note: 'Inbound raw material intake',
      workersCount: 42,
      createdBy: 'ment',
      updatedBy: 'ops.lead',
    ),
    GroupDto(
      id: '2',
      code: 'GR-FL',
      description: 'Fillet operations',
      note: 'Primary processing floor',
      workersCount: 86,
      createdBy: 'ment',
      updatedBy: 'ops.lead',
    ),
    GroupDto(
      id: '3',
      code: 'GR-PKG',
      description: 'Packing shift',
      note: 'Final packing and label verification',
      workersCount: 31,
      createdBy: 'ment',
      updatedBy: 'supervisor.02',
    ),
    GroupDto(
      id: '4',
      code: 'GR-QC',
      description: 'Quality control',
      note: 'Sampling, thresholds, and release checks',
      workersCount: 14,
      createdBy: 'ment',
      updatedBy: 'qa.manager',
    ),
  ];

  @override
  Future<GroupDto?> fetchGroupById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteGroup(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _items.removeWhere((item) => item.id == id);
  }

  @override
  Future<PaginatedResult<GroupDto>> fetchGroups({
    String query = '',
    int page = 1,
    int perPage = 20,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));

    final normalizedQuery = query.trim().toLowerCase();
    final filtered = _items.where((item) {
      if (normalizedQuery.isEmpty) {
        return true;
      }

      return item.code.toLowerCase().contains(normalizedQuery) ||
          item.description.toLowerCase().contains(normalizedQuery) ||
          item.note.toLowerCase().contains(normalizedQuery);
    }).toList();

    final start = (page - 1) * perPage;
    final end = (start + perPage).clamp(0, filtered.length);
    final slice = start >= filtered.length ? <GroupDto>[] : filtered.sublist(start, end);

    return PaginatedResult(
      items: slice,
      page: page,
      perPage: perPage,
      total: filtered.length,
    );
  }

  @override
  Future<GroupDto> saveGroup(GroupDto group) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    final index = _items.indexWhere((item) => item.id == group.id);
    if (index >= 0) {
      _items[index] = group;
      return group;
    }

    final next = group.copyWith(
      id: (_items.length + 1).toString(),
      createdBy: group.createdBy ?? 'mobile.mock',
      updatedBy: group.updatedBy ?? 'mobile.mock',
    );
    _items.add(next);
    return next;
  }
}
