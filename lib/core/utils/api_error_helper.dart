import 'package:dio/dio.dart';
import 'package:template_catra_mobile/core/utils/result.dart';
import 'package:template_catra_mobile/l10n/app_localizations.dart';

enum ErrorType {
  // Network
  noInternet,
  timeout,

  // Auth
  unauthorized,      // chưa login / token hết hạn
  invalidCredentials, // sai user/pass
  forbidden,

  // Data
  notFound,
  conflict,
  validation,

  // Request
  badRequest,

  // Server
  serverError,
  serviceUnavailable,

  // Unknown
  unknown,
}
/// Helper function to handle API errors with status codes
Result<T> handleApiError<T>(
  DioException e, {
  bool login = false,
}) {
  final message = e.message;
  // Network layer
  if (e.type == DioExceptionType.connectionError) {
    return Result.failure(message, errorType: ErrorType.noInternet);
  }

  if (e.type == DioExceptionType.connectionTimeout) {
    return Result.failure(message, errorType: ErrorType.timeout);
  }

  final statusCode = e.response?.statusCode;

  switch (statusCode) {
    case 400:
      return Result.failure(message, errorType: ErrorType.badRequest);

    case 401:
      return Result.failure(
        message,
        errorType: login ? ErrorType.invalidCredentials : ErrorType.unauthorized,
      );

    case 403:
      return Result.failure(message, errorType: ErrorType.forbidden);

    case 404:
      return Result.failure(message, errorType: ErrorType.notFound);

    case 409:
      return Result.failure(message, errorType: ErrorType.conflict);

    case 422:
      return Result.failure(message, errorType: ErrorType.validation);

    case 500:
      return Result.failure(message, errorType: ErrorType.serverError);

    case 502:
    case 503:
    case 504:
      return Result.failure(message, errorType: ErrorType.serviceUnavailable);

    default:
      return Result.failure(message, errorType: ErrorType.unknown);
  }
}


String mapErrorToMessage(
  ErrorType error,
  AppLocalizations l10n,
) {
  switch (error) {
    case ErrorType.noInternet:
      return l10n.no_internet;

    case ErrorType.timeout:
      return l10n.timeout;

    case ErrorType.unauthorized:
      return l10n.session_expired;

    case ErrorType.invalidCredentials:
      return l10n.invalid_credentials;

    case ErrorType.forbidden:
      return l10n.no_permission;

    case ErrorType.notFound:
      return l10n.not_found;

    case ErrorType.conflict:
      return l10n.already_exists;

    case ErrorType.validation:
      return l10n.existed_input;

    case ErrorType.badRequest:
      return l10n.bad_request;

    case ErrorType.serverError:
      return l10n.server_error;

    case ErrorType.serviceUnavailable:
      return l10n.service_unavailable;

    case ErrorType.unknown:
      return l10n.unknown_error;
  }
}
