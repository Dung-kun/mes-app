import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/config/locale/app_localizations_ext.dart';
import 'package:template_catra_mobile/core/constants/app_spacing.dart';
import 'package:template_catra_mobile/core/theme/app_colors.dart';
import 'package:template_catra_mobile/core/utils/api_error_helper.dart';
import 'package:template_catra_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:template_catra_mobile/shared/widgets/error_dialog.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';
  static const routePath = '/login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  ErrorType? _lastError;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _showErrorDialog(ErrorType errorType) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _lastError != errorType) {
        if(_lastError != errorType){
        _lastError = errorType;
        ErrorDialog.show(
          context: context,
          message: mapErrorToMessage(errorType, context.l10n),
          title: 'Lỗi',
          onDismiss: () {
            ref.read(authControllerProvider.notifier).clearError();
            _lastError = null;
          },
        );
      }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    if(authState.hasError){
      final error = authState.error;
      if (error is ErrorType) {
        _showErrorDialog(error);
      } else {
        _showErrorDialog(ErrorType.unknown);
      }
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.loginBackgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: AppSpacing.screenPadding,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.sign_in,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            context.l10n.sign_in_to_start_your_session,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(labelText: context.l10n.username),
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Username is required' : null,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(labelText: context.l10n.password),
                            obscureText: true,
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Password is required' : null,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: authState.isLoading
                                  ? null
                                  : () async {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }

                                      await ref.read(authControllerProvider.notifier).login(
                                            username: _usernameController.text.trim(),
                                            password: _passwordController.text,
                                          );
                                    },
                              child: authState.isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    )
                                  : Text(context.l10n.sign_in),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
