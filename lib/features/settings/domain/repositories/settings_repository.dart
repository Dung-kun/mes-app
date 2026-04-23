import 'package:template_catra_mobile/features/settings/domain/entities/app_settings.dart';

abstract class SettingsRepository {
  Future<AppSettings> load();
  Future<AppSettings> save(AppSettings settings);
}
