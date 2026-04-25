import 'package:flutter/material.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int pageSize;
  final int totalCount;

  /// Chuyển trang bất kỳ
  final ValueChanged<int> onPageChanged;

  /// Đổi số item mỗi trang
  final ValueChanged<int> onPageSizeChanged;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.pageSize,
    required this.totalCount,
    required this.onPageChanged,
    required this.onPageSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final totalPages = totalCount == 0 ? 1 : (totalCount / pageSize).ceil();
    final safeCurrentPage = currentPage.clamp(1, totalPages);

    final startItem =
        totalCount == 0 ? 0 : ((safeCurrentPage - 1) * pageSize) + 1;

    final endItem =
        (safeCurrentPage * pageSize) > totalCount
            ? totalCount
            : (safeCurrentPage * pageSize);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Page info and size selector
          Row(
            children: [
              Text(
                '$startItem-$endItem của $totalCount',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(width: 12),
              _buildCompactPageSizeDropdown(theme),
            ],
          ),
          
          // Right side: Navigation
          Row(
            children: [
              _buildNavButton(
                icon: Icons.keyboard_arrow_left,
                enabled: safeCurrentPage > 1,
                onTap: () => onPageChanged(safeCurrentPage - 1),
              ),
              
              const SizedBox(width: 4),
              
              ..._buildCompactPageButtons(
                currentPage: safeCurrentPage,
                totalPages: totalPages,
                theme: theme,
              ),
              
              const SizedBox(width: 4),
              
              _buildNavButton(
                icon: Icons.keyboard_arrow_right,
                enabled: safeCurrentPage < totalPages,
                onTap: () => onPageChanged(safeCurrentPage + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Dropdown page size
  Widget _buildCompactPageSizeDropdown(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<int>(
        value: pageSize,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(12),
        isDense: true,
        onChanged: (value) {
          if (value != null) {
            onPageSizeChanged(value);
          }
        },
        items: const [
          DropdownMenuItem(value: 5, child: Text('5')),
          DropdownMenuItem(value: 10, child: Text('10')),
          DropdownMenuItem(value: 20, child: Text('20')),
          DropdownMenuItem(value: 50, child: Text('50')),
        ],
      ),
    );
  }

  /// Prev / Next
  Widget _buildNavButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: enabled ? onTap : null,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: enabled ? Colors.white : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: enabled ? Colors.blue.shade200 : Colors.grey.shade300,
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? Colors.blue.shade600 : Colors.grey,
        ),
      ),
    );
  }

  /// Build compact pages with ellipsis
  List<Widget> _buildCompactPageButtons({
    required int currentPage,
    required int totalPages,
    required ThemeData theme,
  }) {
    final pages = _generatePages(currentPage, totalPages);

    return pages.map((page) {
      if (page == -1) {
        return _ellipsis(theme);
      }

      final isActive = page == currentPage;

      return Padding(
        padding: const EdgeInsets.only(right: 4),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: isActive ? null : () => onPageChanged(page),
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive ? theme.colorScheme.primary : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isActive
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),
            child: Text(
              '$page',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isActive ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _ellipsis(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 38,
        child: Center(
          child: Text(
            '...',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  /// -1 = ellipsis
  List<int> _generatePages(int currentPage, int totalPages) {
    if (totalPages <= 7) {
      return List.generate(totalPages, (i) => i + 1);
    }

    if (currentPage <= 4) {
      return [1, 2, 3, 4, 5, -1, totalPages];
    }

    if (currentPage >= totalPages - 3) {
      return [
        1,
        -1,
        totalPages - 4,
        totalPages - 3,
        totalPages - 2,
        totalPages - 1,
        totalPages,
      ];
    }

    return [
      1,
      -1,
      currentPage - 1,
      currentPage,
      currentPage + 1,
      -1,
      totalPages,
    ];
  }
}