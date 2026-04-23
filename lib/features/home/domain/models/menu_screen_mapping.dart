import 'package:template_catra_mobile/features/home/domain/models/menu_item.dart';
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
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_dang_can_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_khong_co_dau_ra_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_khong_co_dau_vao_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_khong_hop_le_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_ngoai_dinh_muc_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_chi_tiet_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_tong_hop_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_qua_thoi_gian_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_theo_can_sau_lang_da_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_theo_cong_nhan_screen.dart';
import 'package:template_catra_mobile/features/sua_ca/presentation/screens/sua_ca_theo_san_pham_screen.dart';
import 'package:template_catra_mobile/features/tang_trong/presentation/screens/chi_tiet_vao_screen.dart';
import 'package:template_catra_mobile/features/tang_trong/presentation/screens/tang_trong_dang_can_screen.dart';
import 'package:template_catra_mobile/features/tang_trong/presentation/screens/tang_trong_tong_hop_screen.dart';
import 'package:template_catra_mobile/features/tui_le/presentation/screens/to_hop_khong_lay_duoc_screen.dart';
import 'package:template_catra_mobile/features/tui_le/presentation/screens/to_hop_theo_size_screen.dart';
import 'package:template_catra_mobile/features/tui_le/presentation/screens/tui_le_chi_tiet_screen.dart';

class MenuScreenMapping {
  static Map<String, List<String>> get routesByParent => {
    'Dữ liệu cơ bản': [
      MaterialBatchCodeScreen.routePath,
      ProductScreen.routePath,
      WorkerBpScreen.routePath,
      BasketScreen.routePath,
      CoiScreen.routePath,
      DinhMucScreen.routePath,
      ServiceCardScreen.routePath,
      WorkerCardScreen.routePath,
      CapPhatTheScreen.routePath,
      CardNumberLookupScreen.routePath,
      LookupWorkerScreen.routePath,
      UserScreen.routePath,
      RoleScreen.routePath,
      PermissionScreen.routePath,
    ],
    'Nguyên liệu': [
      ChiTietScreen.routePath,
      TongHopScreen.routePath,
      TruBiScreen.routePath,
    ],
    'Phi lê': [
      PhiLeChiTietScreen.routePath,
      TheoSanPhamScreen.routePath,
      TheoCongNhanScreen.routePath,
      PhiLeTongHopScreen.routePath,
      KhongCoDauVaoScreen.routePath,
      KhongCoDauRaScreen.routePath,
      QuaThoiGianScreen.routePath,
      KhongHopLeScreen.routePath,
      NgoaiDinhMucScreen.routePath,
      TheoCanSauLangDaScreen.routePath,
      DangCanScreen.routePath,
    ],
    'Sửa cá': [
      SuaCaChiTietScreen.routePath,
      SuaCaTheoSanPhamScreen.routePath,
      SuaCaTheoCongNhanScreen.routePath,
      SuaCaTongHopScreen.routePath,
      SuaCaKhongCoDauVaoScreen.routePath,
      SuaCaKhongCoDauRaScreen.routePath,
      SuaCaQuaThoiGianScreen.routePath,
      SuaCaKhongHopLeScreen.routePath,
      SuaCaNgoaiDinhMucScreen.routePath,
      SuaCaTheoCanSauLangDaScreen.routePath,
      SuaCaDangCanScreen.routePath,
    ],
    'Tăng trọng': [
      ChiTietVaoScreen.routePath,
      TangTrongTongHopScreen.routePath,
      TangTrongDangCanScreen.routePath,
    ],
    'Túi lẻ': [
      TuiLeChiTietScreen.routePath,
      ToHopTheoSizeScreen.routePath,
      ToHopKhongLayDuocScreen.routePath,
    ],
    'Thao tác lỗi': [
      ErrorChiTietScreen.routePath,
      ErrorTongHopScreen.routePath,
    ],
  };

  static List<String> get parentTitles => routesByParent.keys.toList();

  static List<String> getChildTitles(String parentTitle) {
    final parent = MenuItem.parentMenus.firstWhere(
      (menu) => menu.title == parentTitle,
    );
    return parent.children.map((child) => child.title).toList();
  }

  static List<String> getRoutesForParent(String parentTitle) {
    return routesByParent[parentTitle] ?? [];
  }

  static String getRouteForChild(String parentTitle, String childTitle) {
    final childIndex = getChildTitles(parentTitle).indexOf(childTitle);
    final routes = getRoutesForParent(parentTitle);
    if (childIndex >= 0 && childIndex < routes.length) {
      return routes[childIndex];
    }
    return '';
  }
}
