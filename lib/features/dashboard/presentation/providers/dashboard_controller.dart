import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/dashboard/data/repositories/mock_dashboard_repository.dart';
import 'package:template_catra_mobile/features/dashboard/domain/entities/dashboard_metric.dart';
import 'package:template_catra_mobile/features/dashboard/domain/repositories/dashboard_repository.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>(
  (ref) => MockDashboardRepository(),
);

final dashboardControllerProvider =
    AsyncNotifierProvider<DashboardController, List<DashboardMetric>>(
  DashboardController.new,
);

class DashboardController extends AsyncNotifier<List<DashboardMetric>> {
  @override
  Future<List<DashboardMetric>> build() {
    return ref.read(dashboardRepositoryProvider).fetchMetrics();
  }
}
