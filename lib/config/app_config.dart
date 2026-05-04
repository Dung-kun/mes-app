
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiUrl = dotenv.get('API_URL');
final virtualUrl = dotenv.get('VIRTUAL_URL');
final mockUrl = dotenv.get('MOCK_URL');

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
    flavor: AppFlavor.staging,
    appName: 'Template Catra Mobile',
    baseUrl:  apiUrl,
    enableNetworkLogs: true,
  );
  static final virtualConfig = AppConfig(
    flavor: AppFlavor.staging,
    appName: 'Template Catra Mobile',
    baseUrl: virtualUrl,
    enableNetworkLogs: true,
  );
  static final mockConfig = AppConfig(
    flavor: AppFlavor.staging,
    appName: 'Template Catra Mobile',
    baseUrl: mockUrl,
    enableNetworkLogs: true,
  );
}
