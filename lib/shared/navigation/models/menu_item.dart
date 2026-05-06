import 'package:flutter/material.dart';
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
import 'package:template_catra_mobile/features/tui_le/presentation/screens/tui_le_chi_tiet_screen.dart';
import 'package:template_catra_mobile/l10n/app_localizations.dart';

class MenuItem {
  final String Function(AppLocalizations) title; 
  final IconData icon;
  final String routePath;
  final List<MenuItem> children;

  MenuItem({
    required this.title,
    required this.icon,
    this.routePath = '',
    this.children = const [],
  });
  static List<MenuItem> get parentMenus => [
    MenuItem(
      title: (l10n) => l10n.basic_data,
      icon: Icons.list_alt,
      children: [
        MenuItem(title: (l10n) => l10n.material_batch_code, icon: Icons.code, routePath: MaterialBatchCodeScreen.routePath),
        MenuItem(title: (l10n) => l10n.product, icon: Icons.inventory_2, routePath: ProductScreen.routePath),
        MenuItem(title: (l10n) => l10n.worker_bp, icon: Icons.person, routePath: WorkerBpScreen.routePath),
        MenuItem(title: (l10n) => l10n.basket, icon: Icons.shopping_basket, routePath: BasketScreen.routePath),
        MenuItem(title: (l10n) => l10n.coi_code, icon: Icons.inventory_2, routePath: CoiScreen.routePath),
        MenuItem(title: (l10n) => l10n.standard, icon: Icons.speed, routePath: DinhMucScreen.routePath),
        MenuItem(title: (l10n) => l10n.service_card, icon: Icons.credit_card, routePath: ServiceCardScreen.routePath),
        MenuItem(title: (l10n) => l10n.worker_card, icon: Icons.badge, routePath: WorkerCardScreen.routePath),
        MenuItem(title: (l10n) => l10n.card_issuance, icon: Icons.card_membership, routePath: CapPhatTheScreen.routePath),
        MenuItem(title: (l10n) => l10n.card_number_lookup, icon: Icons.search, routePath: CardNumberLookupScreen.routePath),
        MenuItem(title: (l10n) => l10n.worker, icon: Icons.person_search, routePath: LookupWorkerScreen.routePath),
        MenuItem(title: (l10n) => l10n.user, icon: Icons.people, routePath: UserScreen.routePath),
        MenuItem(title: (l10n) => l10n.role, icon: Icons.admin_panel_settings, routePath: RoleScreen.routePath),
        MenuItem(title: (l10n) => l10n.permission_list, icon: Icons.security, routePath: PermissionScreen.routePath),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.material,
      icon: Icons.inventory,
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: ChiTietScreen.routePath),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: TongHopScreen.routePath),
        MenuItem(title: (l10n) => l10n.subtraction, icon: Icons.remove_circle, routePath: TruBiScreen.routePath),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.fillet,
      icon: Icons.content_cut,
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: PhiLeChiTietScreen.routePath),
        MenuItem(title: (l10n) => l10n.to_product, icon: Icons.category, routePath: TheoSanPhamScreen.routePath),
        MenuItem(title: (l10n) => l10n.to_worker, icon: Icons.person, routePath: TheoCongNhanScreen.routePath),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: PhiLeTongHopScreen.routePath),
        MenuItem(title: (l10n) => l10n.no_input, icon: Icons.block, routePath: KhongCoDauVaoScreen.routePath),
        MenuItem(title: (l10n) => l10n.no_output, icon: Icons.block, routePath: KhongCoDauRaScreen.routePath),
        MenuItem(title: (l10n) => l10n.over_time, icon: Icons.timer_off, routePath: QuaThoiGianScreen.routePath),
        MenuItem(title: (l10n) => l10n.invalid, icon: Icons.error_outline, routePath: KhongHopLeScreen.routePath),
        MenuItem(title: (l10n) => l10n.over_standard, icon: Icons.warning, routePath: NgoaiDinhMucScreen.routePath),
        MenuItem(title: (l10n) => l10n.scweightout, icon: Icons.monitor_weight, routePath: TheoCanSauLangDaScreen.routePath),
        MenuItem(title: (l10n) => l10n.weighting, icon: Icons.scale, routePath: DangCanScreen.routePath),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.rework,
      icon: Icons.healing,
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: SuaCaChiTietScreen.routePath),
        MenuItem(title: (l10n) => l10n.to_product, icon: Icons.category, routePath: SuaCaTheoSanPhamScreen.routePath),
        MenuItem(title: (l10n) => l10n.to_worker, icon: Icons.person, routePath: SuaCaTheoCongNhanScreen.routePath),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: SuaCaTongHopScreen.routePath),
        MenuItem(title: (l10n) => l10n.no_input, icon: Icons.block, routePath: SuaCaKhongCoDauVaoScreen.routePath),
        MenuItem(title: (l10n) => l10n.no_output, icon: Icons.block, routePath: SuaCaKhongCoDauRaScreen.routePath),
        MenuItem(title: (l10n) => l10n.over_time, icon: Icons.timer_off, routePath: SuaCaQuaThoiGianScreen.routePath),
        MenuItem(title: (l10n) => l10n.invalid, icon: Icons.error_outline, routePath: SuaCaKhongHopLeScreen.routePath),
        MenuItem(title: (l10n) => l10n.over_standard, icon: Icons.warning, routePath: SuaCaNgoaiDinhMucScreen.routePath),
        MenuItem(title: (l10n) => l10n.scweightout, icon: Icons.monitor_weight, routePath: SuaCaTheoCanSauLangDaScreen.routePath),
        MenuItem(title: (l10n) => l10n.weighting, icon: Icons.scale, routePath: SuaCaDangCanScreen.routePath),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.weight_injection,
      icon: Icons.trending_up,
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.input, routePath: ChiTietVaoScreen.routePath),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: TangTrongTongHopScreen.routePath),
        MenuItem(title: (l10n) => l10n.weighting, icon: Icons.scale, routePath: TangTrongDangCanScreen.routePath),
      ],
    ),
    MenuItem(
      title: (l10n) => 'Túi lẻ',
      icon: Icons.luggage,
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: TuiLeChiTietScreen.routePath),
        MenuItem(title: (l10n) => 'Tổng hợp theo size', icon: Icons.straighten, routePath: ToHopKhongLayDuocScreen.routePath),
        MenuItem(title: (l10n) => 'Tổng hợp không lấy được', icon: Icons.do_not_disturb, routePath: ToHopKhongLayDuocScreen.routePath),
      ],
    ),
    MenuItem(
      title: (l10n) => 'Thao tác lỗi',
      icon: Icons.error,
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: ErrorChiTietScreen.routePath),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: ErrorTongHopScreen.routePath),
      ],
    ),
  ];
}
