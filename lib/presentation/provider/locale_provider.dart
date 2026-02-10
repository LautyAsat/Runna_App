import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleProvider extends StateNotifier<Locale>{
  LocaleProvider() : super(const Locale('es'));

  void changeLocale(Locale newLocale) {
    
    if(state == newLocale) return;
    
    state = newLocale;
  }

  void toggleLocale() {
    
    state = state.languageCode == 'es' 
          ? const Locale('en') 
          : const Locale('es');
  }
}

final localeProvider = StateNotifierProvider<LocaleProvider, Locale>((ref) => LocaleProvider());