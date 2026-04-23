import 'package:template_catra_mobile/features/settings/domain/entities/app_settings.dart';
import 'package:template_catra_mobile/features/settings/domain/repositories/settings_repository.dart';

class MockSettingsRepository implements SettingsRepository {
  AppSettings _settings = const AppSettings(
    useMockApi: true,
    enableBiometrics: false,
  );

  @override
  Future<AppSettings> load() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _settings;
  }

  @override
  Future<AppSettings> save(AppSettings settings) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    _settings = settings;
    return _settings;
  }
}
