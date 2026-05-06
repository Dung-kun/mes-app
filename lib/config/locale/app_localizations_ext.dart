// lib/config/locale/app_localizations_ext.dart
import 'package:flutter/material.dart';
import 'package:template_catra_mobile/l10n/app_localizations.dart';

extension AppLocalizationsExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}