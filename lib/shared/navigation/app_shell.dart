import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/session_provider.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:template_catra_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/user_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/permission_screen.dart';
import 'package:template_catra_mobile/shared/navigation/models/menu_item.dart';


class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> with TickerProviderStateMixin {
  late TabController _parentTabController;
  int _selectedParentIndex = 0;
  final Map<int, int> _childIndexByParent = {};

  late List<TabController> _childControllers;

  @override
  void initState() {
    super.initState();
    _parentTabController = TabController(
      length: MenuItem.parentMenus.length,
      vsync: this,
    );

    // ✅ Tạo sẵn tất cả child controllers
    _childControllers = MenuItem.parentMenus.map((menu) {
      return TabController(
        length: menu.children.length,
        vsync: this,
      );
    }).toList();

    _parentTabController.addListener(_handleParentTabChange);
  }

  @override
  void dispose() {
    _parentTabController.removeListener(_handleParentTabChange);
    _parentTabController.dispose();
    for (final controller in _childControllers) {
      controller.dispose(); // ✅ dispose hết 1 lần
    }
    super.dispose();
  }

  void _handleParentTabChange() {
    final newIndex = _parentTabController.index;
    if (newIndex == _selectedParentIndex) return;
    setState(() => _selectedParentIndex = newIndex);

    final children = MenuItem.parentMenus[newIndex].children;  // 👈
    final savedIndex = (_childIndexByParent[newIndex] ?? 0)
        .clamp(0, children.length - 1);

    if (children.isNotEmpty) {
      context.go(children[savedIndex].routePath);              // 👈
    }
  }

  void _handleChildTabChange(int index) {
    _childIndexByParent[_selectedParentIndex] = index;
    _childControllers[_selectedParentIndex].animateTo(index);

    final children = MenuItem.parentMenus[_selectedParentIndex].children;  // 👈
    if (index < children.length) {
      context.go(children[index].routePath);                               // 👈
    }
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'users':
        _navigateWithTabSync(UserScreen.routePath);        // 👈 bỏ tham số parentTitle
        break;
      case 'permissions':
        _navigateWithTabSync(PermissionScreen.routePath);
        break;
      case 'change_password':
        _showChangePasswordDialog();
        break;
      case 'logout':
        _handleLogout();
        break;
    }
  }

  void _navigateWithTabSync(String routePath) {
    // Tìm parent và child index dựa vào routePath trong MenuItem
    for (int i = 0; i < MenuItem.parentMenus.length; i++) {         // 👈
      final children = MenuItem.parentMenus[i].children;
      for (int j = 0; j < children.length; j++) {
        if (children[j].routePath == routePath) {
          if (_selectedParentIndex != i) {
            _parentTabController.animateTo(i);
            setState(() => _selectedParentIndex = i);
          }
          _childIndexByParent[i] = j;
          _childControllers[i].animateTo(j);
          context.push(routePath);
          return;
        }
      }
    }
  }
  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.lock_reset, color: AppColors.primary),
            SizedBox(width: 8),
            Text('Đổi mật khẩu'),
          ],
        ),
        content: const Text('Tính năng đổi mật khẩu đang được phát triển.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.close),
          ),
        ],
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.logout, color: AppColors.error),
            const SizedBox(width: 8),
            Text(context.l10n.sign_out),
          ],
        ),
        content: Text(context.l10n.confirm_sign_out),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              ref.read(authControllerProvider.notifier).logout(); // Logout
              context.go(LoginScreen.routePath); // Navigate to login
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: Text(context.l10n.sign_out),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(currentSessionProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/MENT.ico',
              height: 30,
            ),
            const SizedBox(width: 8),
            const Text('Ment Automation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: AppColors.iconPrimary,
            ),
            tooltip: 'Tài khoản',
            onSelected: (value) => _handleMenuSelection(value),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'users',
                child: Row(
                  children: [
                    const Icon(Icons.people, color: AppColors.iconSecondary, size: 20),
                    const SizedBox(width: 12),
                    Text(context.l10n.account_list),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'permissions',
                child: Row(
                  children: [
                    const Icon(Icons.admin_panel_settings, color: AppColors.iconSecondary, size: 20),
                    const SizedBox(width: 12),
                    Text(context.l10n.permission_list),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'change_password',
                child: Row(
                  children: [
                    const Icon(Icons.lock_reset, color: AppColors.iconSecondary, size: 20),
                    const SizedBox(width: 12),
                    Text(context.l10n.change_pass),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: AppColors.iconError, size: 20),
                    const SizedBox(width: 12),
                    Text(context.l10n.sign_out, style: TextStyle(color: AppColors.textError)),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                session?.username ?? '',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TabBar(
            controller: _parentTabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: MenuItem.parentMenus.map((menu) => Tab(
              icon: Icon(menu.icon),
              text: menu.title(context.l10n),
            )).toList(),
          ),
        ),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        child: TabBar(
          controller: _childControllers[_selectedParentIndex],
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          onTap: _handleChildTabChange,
          tabs: MenuItem.parentMenus[_selectedParentIndex].children.map((child) => Tab(
              icon: Icon(child.icon),
              text: child.title(context.l10n),
            )).toList(),
        ),
      ),
    );
  }
}
