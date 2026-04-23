import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/groups/data/data_sources/group_data_source.dart';
import 'package:template_catra_mobile/features/groups/data/data_sources/mock_group_data_source.dart';
import 'package:template_catra_mobile/features/groups/data/repositories/mock_group_repository.dart';
import 'package:template_catra_mobile/features/groups/domain/entities/group.dart';
import 'package:template_catra_mobile/features/groups/domain/repositories/group_repository.dart';
import 'package:template_catra_mobile/features/groups/presentation/providers/group_filters_provider.dart';

final groupDataSourceProvider = Provider<GroupDataSource>(
  (ref) => MockGroupDataSource(),
);

final groupRepositoryProvider = Provider<GroupRepository>(
  (ref) => MockGroupRepository(ref.watch(groupDataSourceProvider)),
);

final groupsControllerProvider =
    AsyncNotifierProvider<GroupsController, List<Group>>(GroupsController.new);

final groupByIdProvider = FutureProvider.family<Group?, String>((ref, id) {
  return ref.read(groupRepositoryProvider).fetchGroupById(id);
});

class GroupsController extends AsyncNotifier<List<Group>> {
  @override
  Future<List<Group>> build() {
    final filters = ref.watch(groupFiltersProvider);
    return ref.read(groupRepositoryProvider).fetchGroups(
          query: filters.query,
          page: filters.page,
          perPage: filters.perPage,
        );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final filters = ref.read(groupFiltersProvider);
      return ref.read(groupRepositoryProvider).fetchGroups(
            query: filters.query,
            page: filters.page,
            perPage: filters.perPage,
          );
    });
  }

  void search(String value) {
    ref.read(groupFiltersProvider.notifier).setQuery(value);
    ref.invalidateSelf();
  }

  Future<Group> save(Group group) async {
    final saved = await ref.read(groupRepositoryProvider).saveGroup(group);
    ref.invalidate(groupByIdProvider(saved.id));
    ref.invalidateSelf();
    return saved;
  }

  Future<void> delete(String id) async {
    await ref.read(groupRepositoryProvider).deleteGroup(id);
    ref.invalidate(groupByIdProvider(id));
    ref.invalidateSelf();
  }
}
