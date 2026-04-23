import 'package:template_catra_mobile/features/dashboard/domain/entities/dashboard_metric.dart';

abstract class DashboardRepository {
  Future<List<DashboardMetric>> fetchMetrics();
}
