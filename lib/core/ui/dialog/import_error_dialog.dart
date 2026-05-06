// lib/core/ui/dialogs/import_error_dialog.dart

import 'package:flutter/material.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';

class ImportErrorDialog extends StatelessWidget {
  final List<String> errors;

  const ImportErrorDialog({super.key, required this.errors});

  static Future<void> show(BuildContext context, List<String> errors) {
    return showDialog(
      context: context,
      builder: (_) => ImportErrorDialog(errors: errors),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          Text(context.l10n.import_file_success_but_some_data_may_have_errors),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: errors.length,
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
                Expanded(child: Text(errors[index])),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.l10n.close),
        ),
      ],
    );
  }
}