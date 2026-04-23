import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/profile/data/repositories/mock_profile_repository.dart';
import 'package:template_catra_mobile/features/profile/domain/entities/profile.dart';
import 'package:template_catra_mobile/features/profile/domain/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => MockProfileRepository(),
);

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, Profile>(ProfileController.new);

class ProfileController extends AsyncNotifier<Profile> {
  @override
  Future<Profile> build() {
    return ref.read(profileRepositoryProvider).fetchProfile();
  }
}
