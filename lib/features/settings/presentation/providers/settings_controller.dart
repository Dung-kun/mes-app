import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/settings/data/repositories/mock_settings_repository.dart';
import 'package:template_catra_mobile/features/settings/domain/entities/app_settings.dart';
import 'package:template_catra_mobile/features/settings/domain/repositories/settings_repository.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => MockSettingsRepository(),
);

final settingsControllerProvider =
    AsyncNotifierProvider<SettingsController, AppSettings>(SettingsController.new);

class SettingsController extends AsyncNotifier<AppSettings> {
  @override
  Future<AppSettings> build() {
    return ref.read(settingsRepositoryProvider).load();
  }

  Future<void> toggleBiometrics(bool value) async {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(settingsRepositoryProvider).save(
            current.copyWith(enableBiometrics: value),
          ),
    );
  }
}
