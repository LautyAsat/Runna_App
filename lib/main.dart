import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runna/core/router/app_router.dart';
import 'package:runna/core/theme/app_theme.dart';
import 'package:runna/l10n/app_localizations.dart';
import 'package:runna/presentation/provider/locale_provider.dart';

void main() {
  runApp(const ProviderScope(child: RunnaApp()));
}

class RunnaApp extends ConsumerWidget {
  const RunnaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = ref.watch(localeNotifierProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: "Runna",
      theme: AppTheme.lightTheme,
      routerConfig: router,
      locale: selectedLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
