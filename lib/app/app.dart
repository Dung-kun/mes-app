import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/config/locale/locale_provider.dart';
import 'package:template_catra_mobile/config/router/app_router.dart';
import 'package:template_catra_mobile/config/theme/app_theme.dart';
import 'package:template_catra_mobile/l10n/app_localizations.dart';

class TemplateCatraApp extends ConsumerWidget {
  const TemplateCatraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);
    
    return MaterialApp.router(
      title: 'Template Catra Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,

      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
