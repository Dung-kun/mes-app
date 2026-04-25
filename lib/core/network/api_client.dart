import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/config/app_config.dart';
import 'package:template_catra_mobile/core/network/interceptors/auth_interceptor.dart';
import 'package:template_catra_mobile/core/network/interceptors/error_interceptor.dart';
import 'package:template_catra_mobile/core/storage/token_storage.dart';

final appConfigProvider = Provider<AppConfig>((ref) => AppConfig.mockConfig);
// final appConfigProvider = Provider<AppConfig>((ref) => AppConfig.baseConfig);s
// final appConfigProvider = Provider<AppConfig>((ref) => AppConfig.virtualConfig);

final dioProvider = Provider<Dio>((ref) {
  final config = ref.watch(appConfigProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(AuthInterceptor(tokenStorage));
  dio.interceptors.add(ErrorInterceptor(ref));
  dio.interceptors.add(
  LogInterceptor(
    requestBody: true,
    responseBody: true,
  ),
);
  return dio;
});
