import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final List<MenuItem> children;

  MenuItem({
    required this.title,
    required this.icon,
    this.children = const [],
  });

  static List<MenuItem> get parentMenus => [
    MenuItem(
      title: 'D\u1eef li\u1ec7u c\u01a1 b\u1ea3n',
      icon: Icons.list_alt,
      children: [
        MenuItem(title: 'material batch code', icon: Icons.code),
        MenuItem(title: 'Product', icon: Icons.inventory_2),
        MenuItem(title: 'Worker_BP', icon: Icons.person),
        MenuItem(title: 'basket', icon: Icons.shopping_basket),
        MenuItem(title: 'C\u1ed1i', icon: Icons.grain),
        MenuItem(title: '\u0110\u1ecbnh m\u1ee9c', icon: Icons.speed),
        MenuItem(title: 'service_card', icon: Icons.credit_card),
        MenuItem(title: 'Worker card', icon: Icons.badge),
        MenuItem(title: 'C\u1ea5p ph\u00e1t th\u1ebb', icon: Icons.card_membership),
        MenuItem(title: 'card number lookup', icon: Icons.search),
        MenuItem(title: 'Look up worker', icon: Icons.person_search),
        MenuItem(title: 'User', icon: Icons.people),
        MenuItem(title: 'Role', icon: Icons.admin_panel_settings),
        MenuItem(title: 'Permission', icon: Icons.security),
      ],
    ),
    MenuItem(
      title: 'Nguy\u00ean li\u1ec7u',
      icon: Icons.inventory,
      children: [
        MenuItem(title: 'Chi ti\u1ebft', icon: Icons.list),
        MenuItem(title: 'T\u1ed5ng h\u1ee3p', icon: Icons.summarize),
        MenuItem(title: 'Tr\u1eeb b\u00ec', icon: Icons.remove_circle),
      ],
    ),
    MenuItem(
      title: 'Phi l\u00ea',
      icon: Icons.content_cut,
      children: [
        MenuItem(title: 'Chi ti\u1ebft', icon: Icons.list),
        MenuItem(title: 'Theo s\u1ea3n ph\u1ea9m', icon: Icons.category),
        MenuItem(title: 'Theo c\u00f4ng nh\u00e2n', icon: Icons.person),
        MenuItem(title: 'T\u1ed5ng h\u1ee3p', icon: Icons.summarize),
        MenuItem(title: 'Kh\u00f4ng c\u00f3 \u0111\u1ea7u v\u00e0o', icon: Icons.block),
        MenuItem(title: 'Kh\u00f4ng c\u00f3 \u0111\u1ea7u ra', icon: Icons.block),
        MenuItem(title: 'Qu\u00e1 th\u1eddi gian', icon: Icons.timer_off),
        MenuItem(title: 'Kh\u00f4ng h\u1ee3p l\u1ec7', icon: Icons.error_outline),
        MenuItem(title: 'Ngo\u00e0i \u0111\u1ecbnh m\u1ee9c', icon: Icons.warning),
        MenuItem(title: 'Theo c\u00e2n sau l\u1ea1ng da', icon: Icons.monitor_weight),
        MenuItem(title: '\u0110ang c\u00e2n', icon: Icons.scale),
      ],
    ),
    MenuItem(
      title: 'S\u1eeda c\u00e1',
      icon: Icons.healing,
      children: [
        MenuItem(title: 'Chi ti\u1ebft', icon: Icons.list),
        MenuItem(title: 'Theo s\u1ea3n ph\u1ea9m', icon: Icons.category),
        MenuItem(title: 'Theo c\u00f4ng nh\u00e2n', icon: Icons.person),
        MenuItem(title: 'T\u1ed5ng h\u1ee3p', icon: Icons.summarize),
        MenuItem(title: 'Kh\u00f4ng c\u00f3 \u0111\u1ea7u v\u00e0o', icon: Icons.block),
        MenuItem(title: 'Kh\u00f4ng c\u00f3 \u0111\u1ea7u ra', icon: Icons.block),
        MenuItem(title: 'Qu\u00e1 th\u1eddi gian', icon: Icons.timer_off),
        MenuItem(title: 'Kh\u00f4ng h\u1ee3p l\u1ec7', icon: Icons.error_outline),
        MenuItem(title: 'Ngo\u00e0i \u0111\u1ecbnh m\u1ee9c', icon: Icons.warning),
        MenuItem(title: 'Theo c\u00e2n sau l\u1ea1ng da', icon: Icons.monitor_weight),
        MenuItem(title: '\u0110ang c\u00e2n', icon: Icons.scale),
      ],
    ),
    MenuItem(
      title: 'T\u0103ng tr\u1ecdng',
      icon: Icons.trending_up,
      children: [
        MenuItem(title: 'Chi ti\u1ebft v\u00e0o', icon: Icons.input),
        MenuItem(title: 'T\u1ed5ng h\u1ee3p', icon: Icons.summarize),
        MenuItem(title: '\u0110ang c\u00e2n', icon: Icons.scale),
      ],
    ),
    MenuItem(
      title: 'T\u00fai l\u1ebb',
      icon: Icons.luggage,
      children: [
        MenuItem(title: 'Chi ti\u1ebft', icon: Icons.list),
        MenuItem(title: 'T\u1ed5 h\u1ee3p theo size', icon: Icons.straighten),
        MenuItem(title: 'T\u1ed5 h\u1ee3p kh\u00f4ng l\u1ea5y \u0111\u01b0\u1ee3c', icon: Icons.do_not_disturb),
      ],
    ),
    MenuItem(
      title: 'Thao t\u00e1c l\u1ed7i',
      icon: Icons.error,
      children: [
        MenuItem(title: 'Chi ti\u1ebft', icon: Icons.list),
        MenuItem(title: 'T\u1ed5ng h\u1ee3p', icon: Icons.summarize),
      ],
    ),
  ];
}
