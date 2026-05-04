import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/features/lot/presentation/providers/lot_provider.dart';

class ImportLotSection extends ConsumerStatefulWidget {
  const ImportLotSection({super.key});

  @override
  ConsumerState<ImportLotSection> createState() => _ImportLotSectionState();
}

class _ImportLotSectionState extends ConsumerState<ImportLotSection> {
  PlatformFile? _selectedFile;
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
                backgroundColor: AppColors.error,
              ),
            );
          }
          return;
        }

        setState(() {
          _selectedFile = file;
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Đã chọn tệp: ${file.name}'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      } else {
        // User cancelled the picker
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã hủy chọn tệp'),
              backgroundColor: AppColors.warning,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi chọn tệp: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _downloadTemplate() async {
    try {
      // Show loading message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đang tải xuống tệp Excel...'),
            backgroundColor: AppColors.info,
            duration: Duration(seconds: 1),
          ),
        );
      }

      // Call the actual download functionality
      await ref.read(lotProvider.notifier).downloadTemplate();

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tải xuống tệp Excel thành công!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi tải xuống tệp: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _importFile() async {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn tệp Excel'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    try {
      await ref.read(lotProvider.notifier).importLots(
        file: _selectedFile!,
        replace: _replaceData,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nhập dữ liệu thành công!'),
            backgroundColor: AppColors.success,
          ),
        );
        
        // Clear selection
        setState(() {
          _selectedFile = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi nhập tệp: $e'),
            backgroundColor: AppColors.error,
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
              border: Border.all(color: AppColors.borderLight, width: 1),
              borderRadius: BorderRadius.circular(12),
              color: AppColors.inputBackground,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _selectedFile != null
                          ? 'Đã chọn: ${_selectedFile!.name}'
                          : 'Chọn tệp Excel',
                      style: TextStyle(
                        color: _selectedFile != null
                            ? AppColors.textPrimary
                            : AppColors.primary,
                        fontWeight: _selectedFile != null
                            ? FontWeight.normal
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (_selectedFile == null)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Chỉ hỗ trợ tệp Excel (.xlsx, .xls)',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
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
              activeColor: AppColors.primary,
            ),
            Text(
              'Thay thế dữ liệu hiện có',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        
        Text(
          'Nếu tích vào ô này, toàn bộ dữ liệu hiện có sẽ được thay thế bằng dữ liệu mới từ tệp Excel.',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
