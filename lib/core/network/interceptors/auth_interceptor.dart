import 'package:dio/dio.dart';
import 'package:template_catra_mobile/core/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;
  Dio? _refreshDio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.read();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshed = await _tryRefresh();

      if (refreshed) {
        // Retry request cũ với token mới
        final token = await _tokenStorage.read();
        err.requestOptions.headers['Authorization'] = 'Bearer $token';

        try {
          _refreshDio ??= Dio(BaseOptions(
            baseUrl: err.requestOptions.baseUrl,
          ));
          final response = await _refreshDio!.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          // Refresh thành công nhưng retry thất bại → để ErrorInterceptor xử lý
          return handler.next(err);
        }
      }
      // Refresh thất bại → để ErrorInterceptor xử lý 401 (clear token + redirect login)
    }
    handler.next(err);
  }

  Future<bool> _tryRefresh() async {
    try {
      final currentToken = await _tokenStorage.read();
      if (currentToken == null) return false;

      _refreshDio ??= Dio();
      final response = await _refreshDio!.post(
        'auth/refresh',
        options: Options(
          headers: {
            'Authorization': 'Bearer $currentToken',
            'Accept': 'application/json',
          },
        ),
      );

      final newToken = response.data['access_token'];
      await _tokenStorage.write(newToken);
      return true;
    } catch (e) {
      return false;
    }
  }
}
