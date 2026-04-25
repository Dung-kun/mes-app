import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
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
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final file = result.files.single;
        final fileName = file.name.toLowerCase();
        
        // Validate file extension
        if (!fileName.endsWith('.xlsx') && !fileName.endsWith('.xls')) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Vui lòng chọn tệp Excel (.xlsx hoặc .xls)'),
                backgroundColor: Colors.red,
              ),
            );
          }
          return;
        }

        setState(() {
          _selectedFilePath = file.path;
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Đã chọn tệp: ${file.name}'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        // User cancelled the picker
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã hủy chọn tệp'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi chọn tệp: $e'),
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
          content: Text('Tệp mẫu đang tải xuống...'),
          backgroundColor: Colors.blue,
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi tải xuống mẫu: $e'),
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
            content: Text('Nhập dữ liệu thành công!'),
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
            content: Text('Lỗi khi nhập tệp: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
  final isImporting = ref.watch(lotProvider.select((s) => s.isImporting)); // ✅ select thay vì watch toàn bộ
  ref.listen(
    lotProvider.select((s) => s.importResult),
    (previous, next) {
      if (next == null) return;

      if (next.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            backgroundColor: Colors.red,
          ),
        );

        if (next.hasErrors) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Chi tiết lỗi import'),
                ],
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: next.errors.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Text(next.errors[index])),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Đóng'),
                ),
              ],
            ),
          );
        }
      }

      ref.read(lotProvider.notifier).clearImportResult();
    },
  );
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
              border: Border.all(color: Colors.grey.shade200, width: 1),
              borderRadius: BorderRadius.circular(12),
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
                          ? 'Đã chọn: ${_selectedFilePath!.split('/').last}'
                          : 'Chọn tệp Excel',
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
                      'Chỉ hỗ trợ tệp Excel (.xlsx, .xls)',
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
                label: const Text('XUẤT EXCEL'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: (isImporting) ? null : _importFile,
                icon: isImporting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.upload_file),
                label: Text(isImporting ? 'Đang nhập...' : 'NHẬP TỆP'),
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
            const Text('Thay thế dữ liệu hiện có'),
          ],
        ),
        
        const SizedBox(height: 8),
        
        Text(
          'Nếu tích vào ô này, toàn bộ dữ liệu hiện có sẽ được thay thế bằng dữ liệu mới từ tệp Excel.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
