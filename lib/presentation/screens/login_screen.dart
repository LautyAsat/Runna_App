import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runna/core/exceptions/auth_exceptions.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _userErrorKey;
  String? _passwordErrorKey;
  String? _globalErrorKey;


  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> onTapLogin() async {

    if (!_formKey.currentState!.validate()) {
      return; 
    }

    setState(() {
      _userErrorKey = null;
      _passwordErrorKey = null;
      _globalErrorKey = null;
    });

    final l10n = AppLocalizations.of(context)!;

    try{
      await ref.read(authNotifierProvider.notifier).login(
        _userController.text, 
        _passwordController.text
      );
    }on ValidationException catch (e){
      setState(() {
        _userErrorKey = e.errors["user"];
        _passwordErrorKey = e.errors["password"];
      });
    } on GlobalAuthException catch (e){
      setState(() => _globalErrorKey = e.messageKey);
      
      if (!context.mounted) return;
      
      _showErrorSnackBar(_getErrorString(e.messageKey)!);
        
    } catch (e){
      setState(() => _globalErrorKey = "error_unexpected");

      if (!context.mounted) return;

      _showErrorSnackBar(l10n.error_unexpected);
    }
  }

  String? _getErrorString(String? errorkey){
    
    if(errorkey == null) return null;
    
    switch(errorkey){
      case "error_invalid_credentials": 
        return AppLocalizations.of(context)!.error_invalid_credentials;
      case "error_user_not_exists":
        return AppLocalizations.of(context)!.error_user_not_exists;
      default: return "";
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message, 
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red.shade800, 
        behavior: SnackBarBehavior.floating, 
        margin: const EdgeInsets.all(16), 
        duration: const Duration(seconds: 4),
      ),
    );
  }

  String? _validateUser(String? value){
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.error_empty_username;
    }

    return null;
  }

  String? _validatePassword(String? value){
    
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.error_empty_password;
    }
    
    if (value.length < 6) {
      return AppLocalizations.of(context)!.error_short_password; 
    }
    
    return null;
  }

  void onTapSingUp() {
    context.go('/register');
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(actions: const [SelectorLanguages()]),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48, top: 8),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: _formKey,
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
                      errorText: _getErrorString(_userErrorKey),
                      validator: _validateUser,
                    ),
                    const SizedBox(height: 20),
                    RunnaInput(
                      label: AppLocalizations.of(context)!.password,
                      hint: "********",
                      obscureText: true,
                      controller: _passwordController,
                      errorText: _getErrorString(_passwordErrorKey),
                      validator: _validatePassword,

                    ),
                    const SizedBox(height: 40),
                    MainButton(
                      onTap:  isLoading ? null : onTapLogin,
                      text: isLoading
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
