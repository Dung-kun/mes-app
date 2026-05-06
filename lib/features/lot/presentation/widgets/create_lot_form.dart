import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/features/lot/presentation/providers/lot_provider.dart';

class CreateLotForm extends ConsumerStatefulWidget {
  const CreateLotForm({super.key});

  @override
  ConsumerState<CreateLotForm> createState() => _CreateLotFormState();
}

class _CreateLotFormState extends ConsumerState<CreateLotForm> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _codeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final result = await ref.read(lotProvider.notifier).createLot(
      code: _codeController.text.trim(),
      description: _descriptionController.text.trim(), // In real app, get from auth provider
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: result 
            ? Text(context.l10n.lot_created_successfully)
            : Text(context.l10n.lot_creation_failed),
          backgroundColor: result ? AppColors.success : AppColors.error,
        ),
      );
      
      // Clear form
      _codeController.clear();
      _descriptionController.clear();
      _formKey.currentState?.reset();
    }
    if (mounted) {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCreating = ref.watch(lotProvider.select((s) => s.isCreating));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    labelText: context.l10n.material_batch_code,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: context.l10n.material_batch_code,
                    border:  outline,
                    enabledBorder:  outline,
                    focusedBorder: outline.copyWith(
                      borderSide: const BorderSide(
                        color: AppColors.brandSecondaryLight,
                        width: 1.5,
                      ),
                    ),
      
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    prefixIcon: const Icon(Icons.code, color: Colors.grey),
                    
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
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
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: context.l10n.material_batch_name,
                    hintText: context.l10n.material_batch_name,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    border: outline,
                    enabledBorder: outline,
                    focusedBorder: outline.copyWith(
                      borderSide: const BorderSide(
                        color: AppColors.brandSecondaryLight,
                        width: 1.5,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    prefixIcon: const Icon(Icons.description, color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
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
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (_isSubmitting || isCreating) ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: _isSubmitting || isCreating
                        ?  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(context.l10n.creating),
                            ],
                          )
                        : Text(
                            context.l10n.add,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  final outline = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: AppColors.borderLight,
      width: 1,
    ),
  );
}
