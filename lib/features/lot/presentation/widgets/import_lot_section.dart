import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/lot_provider.dart';

class ImportLotSection extends ConsumerStatefulWidget {
  const ImportLotSection({super.key});

  @override
  ConsumerState<ImportLotSection> createState() => _ImportLotSectionState();
}

class _ImportLotSectionState extends ConsumerState<ImportLotSection> {
  String? _selectedFilePath;
  bool _replaceData = false;

  Future<void> _pickFile() async {
    // Simplified file picker - in real app, use file_picker package
    // For now, just simulate file selection
    try {
      // Simulate file selection
      await Future.delayed(const Duration(milliseconds: 500));
      
      setState(() {
        _selectedFilePath = '/path/to/selected/file.xlsx';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Da chon têp Excel (gi lâp)'),
            backgroundColor: Colors.blue,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lôix khi chon têp: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _downloadTemplate() async {
    try {
      // In a real app, implement actual download functionality
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Têp mâu dang ta xuông...'),
          backgroundColor: Colors.blue,
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lôix khi ta xuông mâu: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _importFile() async {
    if (_selectedFilePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chon têp Excel'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      await ref.read(lotProvider.notifier).importLots(
        filePath: _selectedFilePath!,
        replace: _replaceData,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nhâp d liu thành công!'),
            backgroundColor: Colors.green,
          ),
        );
        
        // Clear selection
        setState(() {
          _selectedFilePath = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lôix khi nhâp têp: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lotState = ref.watch(lotProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // File picker section
        InkWell(
          onTap: _pickFile,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _selectedFilePath != null
                          ? 'Da chon: ${_selectedFilePath!.split('/').last}'
                          : 'Chon têp Excel',
                      style: TextStyle(
                        color: _selectedFilePath != null
                            ? Colors.black87
                            : Theme.of(context).colorScheme.primary,
                        fontWeight: _selectedFilePath != null
                            ? FontWeight.normal
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (_selectedFilePath == null)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Hô trng các têp: .xlsx, .xls',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Action buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _downloadTemplate,
                icon: const Icon(Icons.download),
                label: const Text('XUÂT EXCEL'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: (lotState.isImporting) ? null : _importFile,
                icon: lotState.isImporting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.upload_file),
                label: Text(lotState.isImporting ? 'Dang nhâp...' : 'NHÂP TÊP'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        // Replace option
        Row(
          children: [
            Checkbox(
              value: _replaceData,
              onChanged: (value) {
                setState(() {
                  _replaceData = value ?? false;
                });
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            const Text('Thay th d liu hiên có'),
          ],
        ),
        
        const SizedBox(height: 8),
        
        Text(
          'Nêu tích vào ô này, toàn b d liu hiên có s b thay th b i d liu m i t têp Excel.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
