import 'package:template_catra_mobile/core/models/paginated_result.dart';
import 'package:template_catra_mobile/features/groups/data/dtos/group_dto.dart';

abstract class GroupDataSource {
  Future<PaginatedResult<GroupDto>> fetchGroups({
    String query = '',
    int page = 1,
    int perPage = 20,
  });

  Future<GroupDto?> fetchGroupById(String id);
  Future<GroupDto> saveGroup(GroupDto group);
  Future<void> deleteGroup(String id);
}
