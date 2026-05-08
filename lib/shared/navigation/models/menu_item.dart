import 'package:flutter/material.dart';
import 'package:template_catra_mobile/features/auth/domain/entities/session_user.dart';
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
import 'package:template_catra_mobile/features/products/presentation/screens/parent_product_screen.dart';
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
  final List<String> permissions;

  MenuItem({
    required this.title,
    required this.icon,
    this.routePath = '',
    this.children = const [],
    this.permissions = const [],
  });

  MenuItem copyWith({
    String Function(AppLocalizations)? title,
    IconData? icon,
    String? routePath,
    List<String>? permissions,
    List<MenuItem>? children,
  }) {
    return MenuItem(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      routePath: routePath ?? this.routePath,
      permissions: permissions ?? this.permissions,
      children: children ?? this.children,
    );
  }

  static List<MenuItem> get parentMenus => [
    MenuItem(
      title: (l10n) => l10n.basic_data,
      icon: Icons.list_alt,
      permissions: [
        'xem-ma-lo-nl',
        'xem-san-pham',
        'xem-loai-tom',
        'xem-nguyen-lieu',
        'xem-cong-doan',
        'xem-bo-phan',
        'xem-nhan-vien',
        'xem-the-bo',
        'xem-the-nhan-vien',
        'xem-the-dich-vu',
        'xem-the-tu',
        'xem-nguoi-dung',
        'xem-vai-tro',
        'xem-quyen'
      ],
      children: [
        MenuItem(title: (l10n) => l10n.material_batch_code, icon: const IconData(0xe900), routePath: MaterialBatchCodeScreen.routePath, permissions: ['xem-ma-lo-nl']),
        MenuItem(title: (l10n) => l10n.product, icon: Icons.inventory_2, routePath: ParentProductScreen.routePath, permissions: ['xem-san-pham']),
        MenuItem(title: (l10n) => l10n.worker_bp, icon: Icons.person, routePath: WorkerBpScreen.routePath, permissions: ['xem-bo-phan']),
        MenuItem(title: (l10n) => l10n.basket, icon: Icons.shopping_basket, routePath: BasketScreen.routePath, permissions: ['xem-the-bo']),
        MenuItem(title: (l10n) => l10n.coi_code, icon: Icons.inventory_2, routePath: CoiScreen.routePath, permissions: ['xem-the-coi']),
        MenuItem(title: (l10n) => l10n.standard, icon: Icons.speed, routePath: DinhMucScreen.routePath, permissions: ['dinh-muc']),
        MenuItem(title: (l10n) => l10n.service_card, icon: Icons.credit_card, routePath: ServiceCardScreen.routePath, permissions: ['xem-the-dich-vu-lat-dau']),
        MenuItem(title: (l10n) => l10n.worker_card, icon: Icons.badge, routePath: WorkerCardScreen.routePath, permissions: ['xem-the-nhan-vien']),
        MenuItem(title: (l10n) => l10n.card_issuance, icon: Icons.card_membership, routePath: CapPhatTheScreen.routePath, permissions: ['sua-nhan-vien', 'cap-phat-the']),
        MenuItem(title: (l10n) => l10n.card_number_lookup, icon: Icons.search, routePath: CardNumberLookupScreen.routePath, permissions: ['tra-cuu-ma-the-nv']),
        MenuItem(title: (l10n) => l10n.worker, icon: Icons.person_search, routePath: LookupWorkerScreen.routePath, permissions: ['xem-nhan-vien']),
        MenuItem(title: (l10n) => l10n.user, icon: Icons.people, routePath: UserScreen.routePath, permissions: ['xem-nguoi-dung']),
        MenuItem(title: (l10n) => l10n.role, icon: Icons.admin_panel_settings, routePath: RoleScreen.routePath, permissions: ['xem-vai-tro']),
        MenuItem(title: (l10n) => l10n.permission_list, icon: Icons.security, routePath: PermissionScreen.routePath, permissions: ['xem-quyen']),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.material,
      icon: Icons.inventory,
      permissions: [
        'nguyen-lieu-chi-tiet',
        'nguyen-lieu-tong-hop',
        'nguyen-lieu-tru-bi'
      ],
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: ChiTietScreen.routePath, permissions: ['nguyen-lieu-chi-tiet']),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: TongHopScreen.routePath, permissions: ['nguyen-lieu-tong-hop']),
        MenuItem(title: (l10n) => l10n.subtraction, icon: Icons.remove_circle, routePath: TruBiScreen.routePath, permissions: ['nguyen-lieu-tru-bi']),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.fillet,
      icon: Icons.content_cut,
      permissions: [
        'sua-ca-chi-tiet',
        'sua-ca-theo-san-pham',
        'sua-ca-theo-cong-nhan',
        'sua-ca-tong-hop',
        'sua-ca-khong-co-dau-vao',
        'sua-ca-khong-co-dau-ra',
        'sua-ca-qua-thoi-gian',
        'sua-ca-khong-hop-le',
        'sua-ca-ngoai-dinh-muc',
        'sua-ca-theo-can-sau-lang-da',
        'sua-ca-dang-can'
      ],
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: PhiLeChiTietScreen.routePath, permissions: ['sua-ca-chi-tiet']),
        MenuItem(title: (l10n) => l10n.to_product, icon: Icons.category, routePath: TheoSanPhamScreen.routePath, permissions: ['sua-ca-theo-san-pham']),
        MenuItem(title: (l10n) => l10n.to_worker, icon: Icons.person, routePath: TheoCongNhanScreen.routePath, permissions: ['sua-ca-theo-cong-nhan']),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: PhiLeTongHopScreen.routePath, permissions: ['sua-ca-tong-hop']),
        MenuItem(title: (l10n) => l10n.no_input, icon: Icons.block, routePath: KhongCoDauVaoScreen.routePath, permissions: ['sua-ca-khong-co-dau-vao']),
        MenuItem(title: (l10n) => l10n.no_output, icon: Icons.block, routePath: KhongCoDauRaScreen.routePath, permissions: ['sua-ca-khong-co-dau-ra']),
        MenuItem(title: (l10n) => l10n.over_time, icon: Icons.timer_off, routePath: QuaThoiGianScreen.routePath, permissions: ['sua-ca-qua-thoi-gian']),
        MenuItem(title: (l10n) => l10n.invalid, icon: Icons.error_outline, routePath: KhongHopLeScreen.routePath, permissions: ['sua-ca-khong-hop-le']),
        MenuItem(title: (l10n) => l10n.over_standard, icon: Icons.warning, routePath: NgoaiDinhMucScreen.routePath, permissions: ['sua-ca-ngoai-dinh-muc']),
        MenuItem(title: (l10n) => l10n.scweightout, icon: Icons.monitor_weight, routePath: TheoCanSauLangDaScreen.routePath, permissions: ['sua-ca-theo-can-sau-lang-da']),
        MenuItem(title: (l10n) => l10n.weighting, icon: Icons.scale, routePath: DangCanScreen.routePath, permissions: ['sua-ca-dang-can']),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.rework,
      icon: Icons.healing,
      permissions: [
        'sua-ca-chi-tiet',
        'sua-ca-theo-san-pham',
        'sua-ca-theo-cong-nhan',
        'sua-ca-tong-hop',
        'sua-ca-khong-co-dau-vao',
        'sua-ca-khong-co-dau-ra',
        'sua-ca-qua-thoi-gian',
        'sua-ca-khong-hop-le',
        'sua-ca-ngoai-dinh-muc',
        'sua-ca-theo-can-sau-lang-da',
        'sua-ca-dang-can'
      ],
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: SuaCaChiTietScreen.routePath, permissions: ['sua-ca-chi-tiet']),
        MenuItem(title: (l10n) => l10n.to_product, icon: Icons.category, routePath: SuaCaTheoSanPhamScreen.routePath, permissions: ['sua-ca-theo-san-pham']),
        MenuItem(title: (l10n) => l10n.to_worker, icon: Icons.person, routePath: SuaCaTheoCongNhanScreen.routePath, permissions: ['sua-ca-theo-cong-nhan']),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: SuaCaTongHopScreen.routePath, permissions: ['sua-ca-tong-hop']),
        MenuItem(title: (l10n) => l10n.no_input, icon: Icons.block, routePath: SuaCaKhongCoDauVaoScreen.routePath, permissions: ['sua-ca-khong-co-dau-vao']),
        MenuItem(title: (l10n) => l10n.no_output, icon: Icons.block, routePath: SuaCaKhongCoDauRaScreen.routePath, permissions: ['sua-ca-khong-co-dau-ra']),
        MenuItem(title: (l10n) => l10n.over_time, icon: Icons.timer_off, routePath: SuaCaQuaThoiGianScreen.routePath, permissions: ['sua-ca-qua-thoi-gian']),
        MenuItem(title: (l10n) => l10n.invalid, icon: Icons.error_outline, routePath: SuaCaKhongHopLeScreen.routePath, permissions: ['sua-ca-khong-hop-le']),
        MenuItem(title: (l10n) => l10n.over_standard, icon: Icons.warning, routePath: SuaCaNgoaiDinhMucScreen.routePath, permissions: ['sua-ca-ngoai-dinh-muc']),
        MenuItem(title: (l10n) => l10n.scweightout, icon: Icons.monitor_weight, routePath: SuaCaTheoCanSauLangDaScreen.routePath, permissions: ['sua-ca-theo-can-sau-lang-da']),
        MenuItem(title: (l10n) => l10n.weighting, icon: Icons.scale, routePath: SuaCaDangCanScreen.routePath, permissions: ['sua-ca-dang-can']),
      ],
    ),
    MenuItem(
      title: (l10n) => l10n.weight_injection,
      icon: Icons.trending_up,
      permissions: [
        'tang-trong-chi-tiet-vao',
        'tang-trong-tong-hop',
        'tang-trong-dang-can'
      ],
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.input, routePath: ChiTietVaoScreen.routePath, permissions: ['tang-trong-chi-tiet-vao']),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: TangTrongTongHopScreen.routePath, permissions: ['tang-trong-tong-hop']),
        MenuItem(title: (l10n) => l10n.weighting, icon: Icons.scale, routePath: TangTrongDangCanScreen.routePath, permissions: ['tang-trong-dang-can']),
      ],
    ),
    MenuItem(
      title: (l10n) => 'Túi lẻ',
      icon: Icons.luggage,
      permissions: [
        'to-hop-tui-le-chi-tiet',
        'to-hop-tui-le-tong-hop',
        'to-hop-tui-le-khong-tong-hop'
      ],
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: TuiLeChiTietScreen.routePath, permissions: ['to-hop-tui-le-chi-tiet']),
        MenuItem(title: (l10n) => 'Tổ hợp theo size', icon: Icons.straighten, routePath: ToHopKhongLayDuocScreen.routePath, permissions: ['to-hop-tui-le-tong-hop']),
        MenuItem(title: (l10n) => 'Tổ hợp không lấy được', icon: Icons.do_not_disturb, routePath: ToHopKhongLayDuocScreen.routePath, permissions: ['to-hop-tui-le-khong-tong-hop']),
      ],
    ),
    MenuItem(
      title: (l10n) => 'Thao tác lỗi',
      icon: Icons.error,
      permissions: [
        'loi-chi-tiet',
        'loi-tong-hop'
      ],
      children: [
        MenuItem(title: (l10n) => l10n.detail, icon: Icons.list, routePath: ErrorChiTietScreen.routePath, permissions: ['loi-chi-tiet']),
        MenuItem(title: (l10n) => l10n.synthetic, icon: Icons.summarize, routePath: ErrorTongHopScreen.routePath, permissions: ['loi-tong-hop']),
      ],
    ),
  ];
}

  List<MenuItem> filterMenus(
    List<MenuItem> menus,
    SessionUser user, {
    bool childrenOnly = false,
  }) {
    return menus
        .map((menu) {
          final hasPermission = _checkPermission(menu, user, childrenOnly);
          if (!hasPermission) return null;

          final filteredChildren = filterMenus(
            menu.children,
            user,
            childrenOnly: true,
          );

          // Parent không có children sau khi filter → tuỳ bạn có ẩn không
          if (menu.children.isNotEmpty && filteredChildren.isEmpty) return null;

          return menu.copyWith(children: filteredChildren);
        })
        .whereType<MenuItem>()
        .toList();
  }

  bool _checkPermission(MenuItem menu, SessionUser user, bool childrenOnly) {
    // Không khai báo permission → luôn hiện
    if (menu.permissions.isEmpty) return true;

    // Children: canAll — parent: canAny
    return childrenOnly
        ? user.canAll(menu.permissions)
        : user.canAny(menu.permissions);
  }