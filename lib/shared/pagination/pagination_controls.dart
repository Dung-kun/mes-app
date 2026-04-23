import 'package:flutter/material.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int pageSize;
  final int totalCount;
  final VoidCallback onPageChanged;
  final void Function(int) onPageSizeChanged;
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.pageSize,
    required this.totalCount,
    required this.onPageChanged,
    required this.onPageSizeChanged,
    required this.onNextPage,
    required this.onPreviousPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Page size selector
        Row(
          children: [
            Text(
              'Hiên thi:',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            DropdownButton<int>(
              value: pageSize,
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
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'm i trang',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        
        // Page navigation
        Row(
          children: [
            IconButton(
              onPressed: currentPage > 1 ? onPreviousPage : null,
              icon: const Icon(Icons.chevron_left),
              tooltip: 'Trang trước',
            ),
            Text(
              'Trang $currentPage',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            IconButton(
              onPressed: onNextPage,
              icon: const Icon(Icons.chevron_right),
              tooltip: 'Trang sau',
            ),
          ],
        ),
      ],
    );
  }
}
