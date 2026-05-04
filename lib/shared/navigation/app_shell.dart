import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/session_provider.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:template_catra_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/user_screen.dart';
import 'package:template_catra_mobile/features/basic_data/presentation/screens/permission_screen.dart';
import 'package:template_catra_mobile/features/home/domain/models/menu_item.dart';
import 'package:template_catra_mobile/features/home/domain/models/menu_screen_mapping.dart';
import 'package:template_catra_mobile/features/profile/presentation/screens/profile_screen.dart';

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

    // ✅ Không tạo/dispose gì cả, chỉ navigate
    final parentTitle = MenuScreenMapping.parentTitles[newIndex];
    final childRoutes = MenuScreenMapping.getRoutesForParent(parentTitle);
    final savedIndex = (_childIndexByParent[newIndex] ?? 0)
        .clamp(0, childRoutes.length - 1);

    if (childRoutes.isNotEmpty) {
      context.go(childRoutes[savedIndex]);
    }
  }

  void _handleChildTabChange(int index) {
    _childIndexByParent[_selectedParentIndex] = index;
    _childControllers[_selectedParentIndex].animateTo(index);

    final parentTitle = MenuScreenMapping.parentTitles[_selectedParentIndex];
    final childRoutes = MenuScreenMapping.getRoutesForParent(parentTitle);
    if (index < childRoutes.length) {
      context.go(childRoutes[index]);
    }
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'users':
        _navigateWithTabSync(UserScreen.routePath, 'Dữ liệu cơ bản');
        break;
      case 'permissions':
        _navigateWithTabSync(PermissionScreen.routePath, 'Dữ liệu cơ bản');
        break;
      case 'change_password':
        _showChangePasswordDialog();
        break;
      case 'logout':
        _handleLogout();
        break;
    }
  }

  void _navigateWithTabSync(String routePath, String parentTitle) {
    // Find parent tab index
    final parentIndex = MenuScreenMapping.parentTitles.indexOf(parentTitle);
    if (parentIndex == -1) return;

    // Find child tab index for the route
    final childRoutes = MenuScreenMapping.getRoutesForParent(parentTitle);
    final childIndex = childRoutes.indexOf(routePath);
    if (childIndex == -1) return;

    // Update parent tab
    if (_selectedParentIndex != parentIndex) {
      _parentTabController.animateTo(parentIndex);
      setState(() => _selectedParentIndex = parentIndex);
    }

    // Update child tab
    _childIndexByParent[parentIndex] = childIndex;
    _childControllers[parentIndex].animateTo(childIndex);

    // Navigate to the route
    context.push(routePath);
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
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.logout, color: AppColors.error),
            SizedBox(width: 8),
            Text('Xác nhận đăng xuất'),
          ],
        ),
        content: const Text('Bạn có chắc chắn muốn đăng xuất khỏi hệ thống?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Hủy'),
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
            child: const Text('Đăng xuất'),
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
              const PopupMenuItem<String>(
                value: 'users',
                child: Row(
                  children: [
                    Icon(Icons.people, color: AppColors.iconSecondary, size: 20),
                    SizedBox(width: 12),
                    Text('Danh sách tài khoản'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'permissions',
                child: Row(
                  children: [
                    Icon(Icons.admin_panel_settings, color: AppColors.iconSecondary, size: 20),
                    SizedBox(width: 12),
                    Text('Danh sách vai trò'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'change_password',
                child: Row(
                  children: [
                    Icon(Icons.lock_reset, color: AppColors.iconSecondary, size: 20),
                    SizedBox(width: 12),
                    Text('Đổi mật khẩu'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: AppColors.iconError, size: 20),
                    SizedBox(width: 12),
                    Text('Đăng xuất', style: TextStyle(color: AppColors.textError)),
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
              text: menu.title,
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
              text: child.title,
            )).toList(),
        ),
      ),
    );
  }
}
