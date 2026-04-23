import 'package:template_catra_mobile/features/dashboard/domain/entities/dashboard_metric.dart';
import 'package:template_catra_mobile/features/dashboard/domain/repositories/dashboard_repository.dart';

class MockDashboardRepository implements DashboardRepository {
  @override
  Future<List<DashboardMetric>> fetchMetrics() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return const [
      DashboardMetric(label: 'Active workers', value: '1,284', delta: '+4.2%'),
      DashboardMetric(label: 'Open cards', value: '346', delta: '-1.1%'),
      DashboardMetric(label: 'Attendance sync', value: '98.7%', delta: '+0.6%'),
      DashboardMetric(label: 'Inventory moves', value: '524', delta: '+12.4%'),
    ];
  }
}
