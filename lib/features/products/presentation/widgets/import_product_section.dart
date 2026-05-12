import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/core/ui/dialog/import_error_dialog.dart';
import 'package:template_catra_mobile/core/ui/snackbar/snackbar_extension.dart';
import 'package:template_catra_mobile/features/products/presentation/providers/product_provider.dart';

class ImportProductSection extends ConsumerStatefulWidget {
  const ImportProductSection({super.key});

  @override
  ConsumerState<ImportProductSection> createState() => _ImportProductSectionState();
}

class _ImportProductSectionState extends ConsumerState<ImportProductSection> {
  PlatformFile? _selectedFile;
  bool _replaceData = false;
  bool _isDownloading = false; // ✅ track download state riêng

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
        allowMultiple: false,
      );

      if (!mounted) return;

      if (result == null || result.files.single.path == null) {
        context.showSnack(context.l10n.file_cancelled, type: SnackType.warning);
        return;
      }

      final file = result.files.single;
      // ✅ Validation thừa vì đã filter qua allowedExtensions — xóa đi
      setState(() => _selectedFile = file);
      context.showSnack(
        '${context.l10n.file_selected}: ${file.name}',
        type: SnackType.success,
      );
    } catch (e) {
      if (mounted) {
        context.showSnack('${context.l10n.error}: $e', type: SnackType.error);
      }
    }
  }

  Future<void> _downloadTemplate() async {
    if (_isDownloading) return; // ✅ guard double tap
    
    setState(() => _isDownloading = true);
    
    try {
      context.showSnack(context.l10n.downloading);
      final result = await ref.read(productProvider.notifier).downloadTemplate();

      if (!mounted) return;

      if (result) {
        context.showSnack(context.l10n.import_file_success, type: SnackType.success);
      } else {
        context.showSnack(context.l10n.import_file_failed, type: SnackType.warning);
      }
    } finally {
      if (mounted) setState(() => _isDownloading = false); // ✅ luôn reset dù lỗi
    }
  }

  Future<void> _importFile() async {
    if (_selectedFile == null) {
      context.showSnack(context.l10n.validate_excel_file, type: SnackType.warning);
      return;
    }

    // ✅ Bỏ try/catch — provider đã handle error qua importResult
    await ref.read(productProvider.notifier).importProducts(
      file: _selectedFile!,
      replace: _replaceData,
    );

    if (mounted) {
      setState(() => _selectedFile = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isImporting = ref.watch(productProvider.select((s) => s.isImporting));

    ref.listen(
      productProvider.select((s) => s.importResult),
      (previous, next) {
        if (next == null) return;

        if (next.success) {
          context.showSnack(next.message, type: SnackType.success);
        } else {
          context.showSnack(next.message, type: SnackType.error);
          if (next.hasErrors) {
            ImportErrorDialog.show(context, next.errors);
          }
        }

        // Clear import result by using clearError method
      ref.read(productProvider.notifier).clearError();
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // File picker
        InkWell(
          onTap: _pickFile,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderLight),
              borderRadius: BorderRadius.circular(12),
              color: AppColors.inputBackground,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.file_upload_outlined, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      _selectedFile?.name ?? context.l10n.select_excel_file, // ✅ dùng ?? cho gọn
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
                      'Excel (.xlsx, .xls)',
                      style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                    ),
                  ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                // ✅ disable khi đang download
                onPressed: _isDownloading ? null : _downloadTemplate,
                icon: _isDownloading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.download),
                label: Text(context.l10n.export_excel),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: isImporting ? null : _importFile,
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
                label: Text(isImporting ? context.l10n.loading : context.l10n.import),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Checkbox(
              value: _replaceData,
              onChanged: (value) => setState(() => _replaceData = value ?? false),
              activeColor: AppColors.primary,
            ),
            Text(
              context.l10n.replace,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          context.l10n.replace_warning,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
