import 'package:dio/dio.dart';
import 'package:template_catra_mobile/core/errors/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/storage/token_storage.dart';
import 'package:template_catra_mobile/config/router/app_router.dart';


const String login = '/login';
class ErrorInterceptor extends Interceptor {
  final Ref ref;

  ErrorInterceptor(this.ref);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    final data = response?.data;
    if (err.response?.statusCode == 401) {
      // 🔥 clear token
      await ref.read(tokenStorageProvider).clear();

      // 🔥 redirect về login
      // dùng go_router hoặc navigator
      // ví dụ:
      // ref.read(routerProvider).go('/login');
      ref.read(appRouterProvider).go(login);
    }    
    final message = switch (data) {
      {'message': final String message} => message,
      {'error': final String error} => error,
      _ => err.message ?? 'Unexpected network error',
    };

    handler.reject(
      err.copyWith(
        error: AppException(
          message,
          code: response?.statusCode?.toString(),
        ),
      ),
    );
  }
}
