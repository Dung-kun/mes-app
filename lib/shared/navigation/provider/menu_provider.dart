// shared/navigation/providers/menu_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/session_provider.dart';
import 'package:template_catra_mobile/shared/navigation/models/menu_item.dart';

final filteredMenusProvider = Provider<List<MenuItem>>((ref) {
  final user = ref.watch(sessionUserProvider);
  if (user == null) return [];
  return filterMenus(MenuItem.parentMenus, user);
});