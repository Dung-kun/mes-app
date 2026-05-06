import 'package:template_catra_mobile/core/utils/api_error_helper.dart';

class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;
  final ErrorType? errorType;

  Result.success(this.data, {this.errorType}) : error = null, isSuccess = true;
  Result.failure(this.error, {this.errorType}) : data = null, isSuccess = false;
}