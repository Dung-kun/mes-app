import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/session_provider.dart';
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
          IconButton(
            onPressed: () => context.push(ProfileScreen.routePath),
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Profile',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                session?.username ?? '',
                style: Theme.of(context).textTheme.labelMedium,
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
