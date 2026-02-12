import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    String? usernameError,
    String? passwordError,
    String? generalError,
    @Default(false) bool isLoading,
  }) = _LoginFormState;

  const LoginFormState._();

  bool get hasErrors =>
      usernameError != null || passwordError != null || generalError != null;
  bool get isValid => !hasErrors && !isLoading;
}
