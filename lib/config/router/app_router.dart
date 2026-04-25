import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/config/router/router_notifier.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:template_catra_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/basket_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/cap_phat_the_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/card_number_lookup_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/coi_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/dinh_muc_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/lookup_worker_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/material_batch_code_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/permission_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/product_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/role_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/service_card_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/user_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/worker_bp_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/worker_card_screen.dart';
import 'package:template_catra_mobile/features/error_operations/presentation/screens/error_chi_tiet_screen.dart';
import 'package:template_catra_mobile/features/error_operations/presentation/screens/error_tong_hop_screen.dart';
import 'package:template_catra_mobile/features/groups/presentation/screens/group_detail_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/dang_can_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/khong_co_dau_ra_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/khong_co_dau_vao_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/khong_hop_le_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/ngoai_dinh_muc_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/phi_le_chi_tiet_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/phi_le_tong_hop_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/qua_thoi_gian_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/theo_can_sau_lang_da_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/theo_cong_nhan_screen.dart';
import 'package:template_catra_mobile/features/phi_le/presentation/screens/theo_san_pham_screen.dart';
import 'package:template_catra_mobile/features/raw_materials/presentation/screens/chi_tiet_screen.dart';
import 'package:template_catra_mobile/features/raw_materials/presentation/screens/tong_hop_screen.dart';
import 'package:template_catra_mobile/features/raw_materials/presentation/screens/tru_bi_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_chi_tiet_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_dang_can_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_khong_co_dau_ra_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_khong_co_dau_vao_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_khong_hop_le_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_ngoai_dinh_muc_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_qua_thoi_gian_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_theo_can_sau_lang_da_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_theo_cong_nhan_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_theo_san_pham_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_tong_hop_screen.dart';
import 'package:template_catra_mobile/features/tang_trong/presentation/screens/chi_tiet_vao_screen.dart';
import 'package:template_catra_mobile/features/tang_trong/presentation/screens/tang_trong_dang_can_screen.dart';
import 'package:template_catra_mobile/features/tang_trong/presentation/screens/tang_trong_tong_hop_screen.dart';
import 'package:template_catra_mobile/features/tui_le/presentation/screens/to_hop_khong_lay_duoc_screen.dart';
import 'package:template_catra_mobile/features/tui_le/presentation/screens/to_hop_theo_size_screen.dart';
import 'package:template_catra_mobile/features/tui_le/presentation/screens/tui_le_chi_tiet_screen.dart';
import 'package:template_catra_mobile/features/groups/presentation/screens/groups_screen.dart';
import 'package:template_catra_mobile/features/products/presentation/screens/products_screen.dart';
import 'package:template_catra_mobile/features/profile/presentation/screens/profile_screen.dart';
import 'package:template_catra_mobile/features/settings/presentation/screens/settings_screen.dart';
import 'package:template_catra_mobile/features/workers/presentation/screens/worker_detail_screen.dart';
import 'package:template_catra_mobile/features/workers/presentation/screens/workers_screen.dart';
import 'package:template_catra_mobile/shared/navigation/app_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  final routerNotifier = RouterNotifier(ref);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: routerNotifier,
    initialLocation: routerNotifier.isAuthenticated ? MaterialBatchCodeScreen.routePath : LoginScreen.routePath,
    redirect: (context, state) {
      if (routerNotifier.isLoading) return null;
      final isAuthenticated = routerNotifier.isAuthenticated;
      final isLoggingIn = state.matchedLocation == LoginScreen.routePath;

      if (!isAuthenticated && !isLoggingIn) {
        return LoginScreen.routePath;
      }

      if (isAuthenticated && isLoggingIn) {
        return MaterialBatchCodeScreen.routePath;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: LoginScreen.routePath,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: ProfileScreen.routePath,
        name: ProfileScreen.routeName,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: GroupDetailScreen.createRoutePath,
        name: GroupDetailScreen.createRouteName,
        builder: (context, state) => const GroupDetailScreen(),
      ),
      GoRoute(
        path: GroupDetailScreen.routePath,
        name: GroupDetailScreen.routeName,
        builder: (context, state) => GroupDetailScreen(
          groupId: state.pathParameters['groupId'] ?? '',
        ),
      ),
      GoRoute(
        path: WorkerDetailScreen.createRoutePath,
        name: WorkerDetailScreen.createRouteName,
        builder: (context, state) => const WorkerDetailScreen(),
      ),
      GoRoute(
        path: WorkerDetailScreen.routePath,
        name: WorkerDetailScreen.routeName,
        builder: (context, state) => WorkerDetailScreen(
          workerId: state.pathParameters['workerId'] ?? '',
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          // Dùng cho menu items - Branch 0 (Home)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              // Basic Data Routes
              GoRoute(path: MaterialBatchCodeScreen.routePath, name: MaterialBatchCodeScreen.routeName, builder: (context, state) => const MaterialBatchCodeScreen()),
              GoRoute(path: ProductScreen.routePath, name: ProductScreen.routeName, builder: (context, state) => const ProductScreen()),
              GoRoute(path: WorkerBpScreen.routePath, name: WorkerBpScreen.routeName, builder: (context, state) => const WorkerBpScreen()),
              GoRoute(path: BasketScreen.routePath, name: BasketScreen.routeName, builder: (context, state) => const BasketScreen()),
              GoRoute(path: CoiScreen.routePath, name: CoiScreen.routeName, builder: (context, state) => const CoiScreen()),
              GoRoute(path: DinhMucScreen.routePath, name: DinhMucScreen.routeName, builder: (context, state) => const DinhMucScreen()),
              GoRoute(path: ServiceCardScreen.routePath, name: ServiceCardScreen.routeName, builder: (context, state) => const ServiceCardScreen()),
              GoRoute(path: WorkerCardScreen.routePath, name: WorkerCardScreen.routeName, builder: (context, state) => const WorkerCardScreen()),
              GoRoute(path: CapPhatTheScreen.routePath, name: CapPhatTheScreen.routeName, builder: (context, state) => const CapPhatTheScreen()),
              GoRoute(path: CardNumberLookupScreen.routePath, name: CardNumberLookupScreen.routeName, builder: (context, state) => const CardNumberLookupScreen()),
              GoRoute(path: LookupWorkerScreen.routePath, name: LookupWorkerScreen.routeName, builder: (context, state) => const LookupWorkerScreen()),
              GoRoute(path: UserScreen.routePath, name: UserScreen.routeName, builder: (context, state) => const UserScreen()),
              GoRoute(path: RoleScreen.routePath, name: RoleScreen.routeName, builder: (context, state) => const RoleScreen()),
              GoRoute(path: PermissionScreen.routePath, name: PermissionScreen.routeName, builder: (context, state) => const PermissionScreen()),
              
              // Raw Materials Routes
              GoRoute(path: ChiTietScreen.routePath, name: ChiTietScreen.routeName, builder: (context, state) => const ChiTietScreen()),
              GoRoute(path: TongHopScreen.routePath, name: TongHopScreen.routeName, builder: (context, state) => const TongHopScreen()),
              GoRoute(path: TruBiScreen.routePath, name: TruBiScreen.routeName, builder: (context, state) => const TruBiScreen()),
              
              // Phi Le Routes
              GoRoute(path: PhiLeChiTietScreen.routePath, name: PhiLeChiTietScreen.routeName, builder: (context, state) => const PhiLeChiTietScreen()),
              GoRoute(path: TheoSanPhamScreen.routePath, name: TheoSanPhamScreen.routeName, builder: (context, state) => const TheoSanPhamScreen()),
              GoRoute(path: TheoCongNhanScreen.routePath, name: TheoCongNhanScreen.routeName, builder: (context, state) => const TheoCongNhanScreen()),
              GoRoute(path: PhiLeTongHopScreen.routePath, name: PhiLeTongHopScreen.routeName, builder: (context, state) => const PhiLeTongHopScreen()),
              GoRoute(path: KhongCoDauVaoScreen.routePath, name: KhongCoDauVaoScreen.routeName, builder: (context, state) => const KhongCoDauVaoScreen()),
              GoRoute(path: KhongCoDauRaScreen.routePath, name: KhongCoDauRaScreen.routeName, builder: (context, state) => const KhongCoDauRaScreen()),
              GoRoute(path: QuaThoiGianScreen.routePath, name: QuaThoiGianScreen.routeName, builder: (context, state) => const QuaThoiGianScreen()),
              GoRoute(path: KhongHopLeScreen.routePath, name: KhongHopLeScreen.routeName, builder: (context, state) => const KhongHopLeScreen()),
              GoRoute(path: NgoaiDinhMucScreen.routePath, name: NgoaiDinhMucScreen.routeName, builder: (context, state) => const NgoaiDinhMucScreen()),
              GoRoute(path: TheoCanSauLangDaScreen.routePath, name: TheoCanSauLangDaScreen.routeName, builder: (context, state) => const TheoCanSauLangDaScreen()),
              GoRoute(path: DangCanScreen.routePath, name: DangCanScreen.routeName, builder: (context, state) => const DangCanScreen()),
              
              // Sua Ca Routes
              GoRoute(path: SuaCaChiTietScreen.routePath, name: SuaCaChiTietScreen.routeName, builder: (context, state) => const SuaCaChiTietScreen()),
              GoRoute(path: SuaCaTheoSanPhamScreen.routePath, name: SuaCaTheoSanPhamScreen.routeName, builder: (context, state) => const SuaCaTheoSanPhamScreen()),
              GoRoute(path: SuaCaTheoCongNhanScreen.routePath, name: SuaCaTheoCongNhanScreen.routeName, builder: (context, state) => const SuaCaTheoCongNhanScreen()),
              GoRoute(path: SuaCaTongHopScreen.routePath, name: SuaCaTongHopScreen.routeName, builder: (context, state) => const SuaCaTongHopScreen()),
              GoRoute(path: SuaCaKhongCoDauVaoScreen.routePath, name: SuaCaKhongCoDauVaoScreen.routeName, builder: (context, state) => const SuaCaKhongCoDauVaoScreen()),
              GoRoute(path: SuaCaKhongCoDauRaScreen.routePath, name: SuaCaKhongCoDauRaScreen.routeName, builder: (context, state) => const SuaCaKhongCoDauRaScreen()),
              GoRoute(path: SuaCaQuaThoiGianScreen.routePath, name: SuaCaQuaThoiGianScreen.routeName, builder: (context, state) => const SuaCaQuaThoiGianScreen()),
              GoRoute(path: SuaCaKhongHopLeScreen.routePath, name: SuaCaKhongHopLeScreen.routeName, builder: (context, state) => const SuaCaKhongHopLeScreen()),
              GoRoute(path: SuaCaNgoaiDinhMucScreen.routePath, name: SuaCaNgoaiDinhMucScreen.routeName, builder: (context, state) => const SuaCaNgoaiDinhMucScreen()),
              GoRoute(path: SuaCaTheoCanSauLangDaScreen.routePath, name: SuaCaTheoCanSauLangDaScreen.routeName, builder: (context, state) => const SuaCaTheoCanSauLangDaScreen()),
              GoRoute(path: SuaCaDangCanScreen.routePath, name: SuaCaDangCanScreen.routeName, builder: (context, state) => const SuaCaDangCanScreen()),
              
              // Tang Trong Routes
              GoRoute(path: ChiTietVaoScreen.routePath, name: ChiTietVaoScreen.routeName, builder: (context, state) => const ChiTietVaoScreen()),
              GoRoute(path: TangTrongTongHopScreen.routePath, name: TangTrongTongHopScreen.routeName, builder: (context, state) => const TangTrongTongHopScreen()),
              GoRoute(path: TangTrongDangCanScreen.routePath, name: TangTrongDangCanScreen.routeName, builder: (context, state) => const TangTrongDangCanScreen()),
              
              // Tui Le Routes
              GoRoute(path: TuiLeChiTietScreen.routePath, name: TuiLeChiTietScreen.routeName, builder: (context, state) => const TuiLeChiTietScreen()),
              GoRoute(path: ToHopTheoSizeScreen.routePath, name: ToHopTheoSizeScreen.routeName, builder: (context, state) => const ToHopTheoSizeScreen()),
              GoRoute(path: ToHopKhongLayDuocScreen.routePath, name: ToHopKhongLayDuocScreen.routeName, builder: (context, state) => const ToHopKhongLayDuocScreen()),
              
              // Error Operations Routes
              GoRoute(path: ErrorChiTietScreen.routePath, name: ErrorChiTietScreen.routeName, builder: (context, state) => const ErrorChiTietScreen()),
              GoRoute(path: ErrorTongHopScreen.routePath, name: ErrorTongHopScreen.routeName, builder: (context, state) => const ErrorTongHopScreen()),
            ],
          ),
          // Branch 1 - Groups
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: GroupsScreen.routePath,
                name: GroupsScreen.routeName,
                builder: (context, state) => const GroupsScreen(),
              ),
            ],
          ),
          // Branch 2 - Workers
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: WorkersScreen.routePath,
                name: WorkersScreen.routeName,
                builder: (context, state) => const WorkersScreen(),
              ),
            ],
          ),
          // Branch 3 - Products
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ProductsScreen.routePath,
                name: ProductsScreen.routeName,
                builder: (context, state) => const ProductsScreen(),
              ),
            ],
          ),
          // Branch 4 - Settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: SettingsScreen.routePath,
                name: SettingsScreen.routeName,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
