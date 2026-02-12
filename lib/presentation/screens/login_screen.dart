import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runna/l10n/app_localizations.dart';
import 'package:runna/presentation/provider/login_form_provider.dart';
import 'package:runna/presentation/widgets/custom_main_button.dart';
import 'package:runna/presentation/widgets/custom_text_field.dart';
import 'package:runna/presentation/widgets/selector_languages.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> onTapLogin() async {
    final formNotifier = ref.read(loginFormNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    // Limpiamos errores al intentar de nuevo
    formNotifier.clearFieldErrors();

    // Intentamos hacer login pasando los valores y mensajes traducidos
    final success = await formNotifier.submit(
      _userController.text,
      _passwordController.text,
      emptyUsernameError: l10n.error_empty_username,
      emptyPasswordError: l10n.error_empty_password,
      invalidCredentialsError: l10n.error_invalid_credentials,
    );

    if (!success && mounted) {
      // Si falla, mostramos el error general en un snackbar
      final formState = ref.read(loginFormNotifierProvider);
      if (formState.generalError != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(formState.generalError!, style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.inter().fontFamily),)));
      }
    }
  }

  void onTapSingUp() {
    context.go('/register');
  }

  @override
  Widget build(BuildContext context) {
    // Escuchamos el estado del form para mostrar errores en los campos
    final formState = ref.watch(loginFormNotifierProvider);

    return Scaffold(
      appBar: AppBar(actions: const [SelectorLanguages()]),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, top: 8),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _header(),
                  const SizedBox(height: 40),
                  RunnaInput(
                    label: AppLocalizations.of(context)!.username,
                    hint: "John_Doe",
                    controller: _userController,
                    errorText: formState.usernameError,
                  ),
                  const SizedBox(height: 20),
                  RunnaInput(
                    label: AppLocalizations.of(context)!.password,
                    hint: "********",
                    obscureText: true,
                    controller: _passwordController,
                    errorText: formState.passwordError,
                  ),
                  const SizedBox(height: 40),
                  MainButton(
                    onTap: formState.isLoading ? null : onTapLogin,
                    text: formState.isLoading
                        ? AppLocalizations.of(context)!.loading
                        : AppLocalizations.of(context)!.login,
                  ),
                  const SizedBox(height: 20),
                  divider(),
                  const SizedBox(height: 20),
                  MainButton(
                    onTap: onTapSingUp,
                    text: AppLocalizations.of(context)!.sing_up,
                    isSecondary: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row divider() {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.grey)),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("O", style: TextStyle(color: Colors.grey)),
        ),

        Expanded(child: Divider(thickness: 1, color: Colors.grey)),
      ],
    );
  }

  Column _header() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.welcome,
          style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.bold,
            height: 1,
            fontFamily: GoogleFonts.caveat().fontFamily,
          ),
        ),
        Text(
          "Runna",
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.caveat().fontFamily,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
