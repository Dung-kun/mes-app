class ImportResult {
  final bool success;
  final String message;
  final List<String> errors;

  const ImportResult({
    required this.success,
    required this.message,
    required this.errors,
  });

  factory ImportResult.fromJson(Map<String, dynamic> json) {
    return ImportResult(
      success: json['success'] as bool,
      message: json['message'] as String,
      errors: (json['errors'] as List?)
          ?.map((e) => e.toString())
          .toList() ?? [],
    );
  }

  bool get hasErrors => errors.isNotEmpty;
}