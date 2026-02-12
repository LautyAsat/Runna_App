import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runna/core/router/app_router.dart';
import 'package:runna/l10n/app_localizations.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
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

  void onTapLogin() {
    final username = _userController.text;
    final password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      ref.read(authNotifierProvider.notifier).login(username);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.complete_fields)),
      );
    }
  }

  void onTapSingUp() {
    context.go('/register');
  }

  @override
  Widget build(BuildContext context) {
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
                  ),
                  const SizedBox(height: 20),
                  RunnaInput(
                    label: AppLocalizations.of(context)!.password,
                    hint: "********",
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 40),
                  MainButton(
                    onTap: onTapLogin,
                    text: AppLocalizations.of(context)!.login,
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
