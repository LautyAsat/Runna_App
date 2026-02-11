import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        const SnackBar(content: Text('Por favor, completa los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [SelectorLanguages()],
                  ),
                  const SizedBox(height: 80),
                  _Header(),
                  const SizedBox(height: 80),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text _Header() {
    return Text(
      AppLocalizations.of(context)!.welcome,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
