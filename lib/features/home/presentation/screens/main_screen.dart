import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/core/theme/app_theme_helper.dart';
import 'package:template_catra_mobile/features/home/domain/models/menu_screen_mapping.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  static const routeName = 'main';
  static const routePath = '/main';

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _selectedParentIndex = 0;
  int _selectedChildIndex = 0;

  @override
  Widget build(BuildContext context) {
    final parentTitles = MenuScreenMapping.parentTitles;
    final selectedParentTitle = parentTitles[_selectedParentIndex];
    final childTitles = MenuScreenMapping.getChildTitles(selectedParentTitle);
    final childRoutes = MenuScreenMapping.getRoutesForParent(selectedParentTitle);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PES System'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight * 2),
          child: Column(
            children: [
              // Parent TabBar
              TabBar(
                isScrollable: true,
                tabs: parentTitles.map((title) => Tab(
                  text: title,
                )).toList(),
                onTap: (index) {
                  setState(() {
                    _selectedParentIndex = index;
                    _selectedChildIndex = 0; // Reset child index when parent changes
                  });
                },
              ),
              // Child TabBar
              TabBar(
                isScrollable: true,
                tabs: childTitles.map((title) => Tab(
                  text: title,
                )).toList(),
                onTap: (index) {
                  setState(() {
                    _selectedChildIndex = index;
                  });
                  // Navigate to the selected child screen
                  if (index < childRoutes.length) {
                    context.go(childRoutes[index]);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedChildIndex,
        children: childRoutes.map((route) {
          return Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder_open,
                          size: 64,
                          color: AppColors.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          route.split('/').last,
                          style: AppThemeHelper.getHeadlineStyle(context),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Content for $route',
                          style: AppThemeHelper.getBodyStyle(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
