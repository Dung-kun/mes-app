import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:template_catra_mobile/features/profile/presentation/screens/profile_screen.dart';
import 'package:template_catra_mobile/features/settings/presentation/providers/settings_controller.dart';
import 'package:template_catra_mobile/shared/widgets/app_async_view.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const routeName = 'settings';
  static const routePath = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: AppAsyncView(
        value: settingsState,
        data: (settings) => ListView(
          padding: AppSpacing.screenPadding,
          children: [
            Card(
              child: ListTile(
                title: const Text('API mode'),
                subtitle: Text(settings.useMockApi ? 'Mock repositories enabled' : 'Live API enabled'),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: ListTile(
                title: const Text('Profile'),
                subtitle: const Text('View session identity and effective permissions'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(ProfileScreen.routePath),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: SwitchListTile(
                title: const Text('Biometric unlock'),
                subtitle: const Text('Local UX placeholder for future secure auth'),
                value: settings.enableBiometrics,
                onChanged: (value) {
                  ref.read(settingsControllerProvider.notifier).toggleBiometrics(value);
                },
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: ListTile(
                title: const Text('Sign out'),
                subtitle: const Text('Clear the current mock session token'),
                trailing: const Icon(Icons.logout),
                onTap: () => ref.read(authControllerProvider.notifier).logout(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
