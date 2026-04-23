
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiUrl = dotenv.get('API_URL');

enum AppFlavor {
  mock,
  staging,
  production,
}

class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.baseUrl,
    required this.enableNetworkLogs,
  });

  final AppFlavor flavor;
  final String appName;
  final String baseUrl;
  final bool enableNetworkLogs;

  static final baseConfig = AppConfig(
    flavor: AppFlavor.mock,
    appName: 'Template Catra Mobile',
    baseUrl: apiUrl,
    enableNetworkLogs: true,
  );
}
