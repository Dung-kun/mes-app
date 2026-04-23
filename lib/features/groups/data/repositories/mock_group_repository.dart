import 'package:template_catra_mobile/features/groups/data/data_sources/group_data_source.dart';
import 'package:template_catra_mobile/features/groups/data/dtos/group_dto.dart';
import 'package:template_catra_mobile/features/groups/domain/entities/group.dart';
import 'package:template_catra_mobile/features/groups/domain/repositories/group_repository.dart';

class MockGroupRepository implements GroupRepository {
  MockGroupRepository(this._dataSource);

  final GroupDataSource _dataSource;

  @override
  Future<Group?> fetchGroupById(String id) async {
    final dto = await _dataSource.fetchGroupById(id);
    return dto?.toDomain();
  }

  @override
  Future<List<Group>> fetchGroups({
    String query = '',
    int page = 1,
    int perPage = 20,
  }) async {
    final result = await _dataSource.fetchGroups(
      query: query,
      page: page,
      perPage: perPage,
    );

    return result.items.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> deleteGroup(String id) {
    return _dataSource.deleteGroup(id);
  }

  @override
  Future<Group> saveGroup(Group group) async {
    final dto = GroupDto(
      id: group.id,
      code: group.code,
      description: group.description,
      note: group.note,
      workersCount: group.workerCount,
      createdBy: group.createdBy,
      updatedBy: 'mobile.mock',
    );

    final saved = await _dataSource.saveGroup(dto);
    return saved.toDomain();
  }
}
