import 'package:template_catra_mobile/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Profile> fetchProfile();
}
