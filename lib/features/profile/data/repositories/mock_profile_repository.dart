import 'package:template_catra_mobile/features/profile/domain/entities/profile.dart';
import 'package:template_catra_mobile/features/profile/domain/repositories/profile_repository.dart';

class MockProfileRepository implements ProfileRepository {
  @override
  Future<Profile> fetchProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const Profile(
      id: '1',
      displayName: 'Operations Lead',
      username: 'demo',
      permissions: [
        'xem-bo-phan',
        'xem-nhan-vien',
        'xem-san-pham',
        'xem-nguoi-dung',
      ],
    );
  }
}
