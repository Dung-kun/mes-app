import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/features/products/presentation/providers/product_provider.dart';

class CreateProductForm extends ConsumerStatefulWidget {
  const CreateProductForm({
    super.key,
    required this.isParent,
    this.parentId,
  });

  final bool isParent;
  final String? parentId;

  @override
  ConsumerState<CreateProductForm> createState() => _CreateProductFormState();
}

class _CreateProductFormState extends ConsumerState<CreateProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _noteController = TextEditingController();
  final _wWinController = TextEditingController();
  final _wMaxController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _codeController.dispose();
    _descriptionController.dispose();
    _noteController.dispose();
    _wWinController.dispose();
    _wMaxController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final success = await ref.read(productProvider.notifier).createProduct(
      code: _codeController.text.trim(),
      description: _descriptionController.text.trim(),
      parentId: widget.parentId ?? (widget.isParent ? '0' : null),
      wWin: widget.isParent ? null : double.tryParse(_wWinController.text),
      wMax: widget.isParent ? null : double.tryParse(_wMaxController.text),
      note: _noteController.text.trim(),
    );

    if (mounted && success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success ? context.l10n.product_created_successfully : context.l10n.product_creation_failed,
          ),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }

    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Code field
            TextFormField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: context.l10n.product_code,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.product_code_required;
                }
                return null;
              },
            ),
            
            const SizedBox(height: 16),
            
            // Description field
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: context.l10n.product_name,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.product_name_required;
                }
                return null;
              },
            ),
            
            
            // Weight fields (only for child products)
            if (!widget.isParent) ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _wWinController,
                decoration: InputDecoration(
                  labelText: context.l10n.g_min,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final weight = double.tryParse(value);
                    if (weight == null || weight <= 0) {
                      return context.l10n.g_min_invalid;
                    }
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _wMaxController,
                decoration: InputDecoration(
                  labelText: context.l10n.g_max,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final weight = double.tryParse(value);
                    if (weight == null || weight <= 0) {
                      return context.l10n.g_max_invalid;
                    }
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: 16),
            // Note field
            TextFormField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: context.l10n.note,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            
            const SizedBox(height: 24),
            
            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(context.l10n.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
