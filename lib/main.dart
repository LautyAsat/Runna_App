import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runna/core/theme/app_theme.dart';
import 'package:runna/l10n/app_localizations.dart';
import 'package:runna/presentation/provider/locale_provider.dart';
import 'package:runna/presentation/widgets/auth_wrapper.dart';


void main() {
  runApp( const ProviderScope(
    child: RunnaApp()
  ));
}

class RunnaApp extends ConsumerWidget {
  const RunnaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    final selectedLocale = ref.watch(localeProvider);

    return MaterialApp(
      title: "Runna",
      theme: AppTheme.lightTheme,
      home: AuthWrapper(),
      locale: selectedLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
