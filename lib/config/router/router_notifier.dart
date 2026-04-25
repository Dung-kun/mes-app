import 'package:flutter/material.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen(authControllerProvider, (_, next) {
      notifyListeners();
    });
  }

  final Ref _ref;

  bool get isAuthenticated =>
      _ref.read(authControllerProvider).valueOrNull?.isAuthenticated ?? false;

  bool get isLoading =>
      _ref.read(authControllerProvider).isLoading;
}