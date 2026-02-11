import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    return const Locale('es');
  }

  void changeLocale(Locale newLocale) {
    if (state == newLocale) return;

    state = newLocale;
  }

  void toggleLocale() {
    state = state.languageCode == 'es'
        ? const Locale('en')
        : const Locale('es');
  }
}
