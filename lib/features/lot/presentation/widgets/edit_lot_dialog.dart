import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/core/theme/app_theme_helper.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/features/lot/domain/entities/lot.dart';

class EditLotDialog extends ConsumerStatefulWidget {
  final Lot lot;
  final Future<bool?> Function(String code, String description) onSave; // ← Future<bool?>

  const EditLotDialog({
    super.key,
    required this.lot,
    required this.onSave,
  });

  @override
  ConsumerState<EditLotDialog> createState() => _EditLotDialogState();
}

class _EditLotDialogState extends ConsumerState<EditLotDialog> {
  late final TextEditingController _codeController;
  late final TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.lot.code);
    _descriptionController = TextEditingController(text: widget.lot.description);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_formKey.currentState!.validate()) return;

  setState(() => _isSubmitting = true);

  final confirmed = await widget.onSave(
    _codeController.text.trim(),
    _descriptionController.text.trim(),
  );

  if (mounted) {
    setState(() => _isSubmitting = false);  // ← reset dù confirm hay không
  }

  if (confirmed == true && mounted) {
    Navigator.of(context).pop();
  }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(
                  Icons.edit,
                  color: AppColors.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  context.l10n.edit_material_batch,
                  style: AppThemeHelper.getHeadlineStyle(context).copyWith(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Form
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Code field
                  TextFormField(
                    controller: _codeController,
                    decoration: AppThemeHelper.getInputDecoration(
                      labelText: context.l10n.material_batch_code,
                      hintText: context.l10n.material_batch_code,
                      prefixIcon: const Icon(Icons.code, color: AppColors.iconSecondary),
                    ),
                    style: const TextStyle(color: AppColors.textPrimary),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return context.l10n.lot_code_required;
                      }
                      return null;
                    },
                    enabled: !_isSubmitting,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Description field
                  TextFormField(
                    controller: _descriptionController,
                    decoration: AppThemeHelper.getInputDecoration(
                      labelText: context.l10n.material_batch_name,
                      hintText: context.l10n.material_batch_name,
                      prefixIcon: const Icon(Icons.description, color: AppColors.iconSecondary),
                    ),
                    style: const TextStyle(color: AppColors.textPrimary),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return context.l10n.lot_description_required;
                      }
                      return null;
                    },
                    enabled: !_isSubmitting,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Current info display
                
                  
                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(),
                          style: AppThemeHelper.getSecondaryButtonStyle(),
                          child: Text(
                            context.l10n.cancel,
                            style: const TextStyle(color: AppColors.textSecondary),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _handleSave,
                          style: AppThemeHelper.getPrimaryButtonStyle(),
                          child: _isSubmitting
                              ?  Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            AppColors.textOnAccent,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(context.l10n.saving),
                                    ],
                                  ),
                              )
                              : Text(context.l10n.save_changes),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Confirmation dialog before editing
class EditConfirmationDialog extends StatelessWidget {
  final Lot lot;
  final VoidCallback onConfirm;

  const EditConfirmationDialog({
    super.key,
    required this.lot,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.infoBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.help_outline,
                color: AppColors.info,
                size: 32,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Title
            Text(
              context.l10n.confirm_update_title,
              style: AppThemeHelper.getHeadlineStyle(context).copyWith(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 12),
            
            // Message
            Text(
              '${context.l10n.confirm_update} "${lot.code}"?',
              style: AppThemeHelper.getBodyStyle(context),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 8),
            
            Text(
              context.l10n.confirm_update_system,
              style: AppThemeHelper.getCaptionStyle(context),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 24),
            
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: AppThemeHelper.getSecondaryButtonStyle(),
                    child: Text(
                      context.l10n.cancel,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onConfirm();
                    },
                    style: AppThemeHelper.getPrimaryButtonStyle(),
                    child: Text(context.l10n.confirm),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
