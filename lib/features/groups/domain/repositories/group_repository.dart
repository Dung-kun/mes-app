import 'package:template_catra_mobile/features/groups/domain/entities/group.dart';

abstract class GroupRepository {
  Future<List<Group>> fetchGroups({
    String query = '',
    int page = 1,
    int perPage = 20,
  });

  Future<Group?> fetchGroupById(String id);
  Future<Group> saveGroup(Group group);
  Future<void> deleteGroup(String id);
}
