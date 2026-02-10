import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runna/presentation/provider/locale_provider.dart';

class SelectorLanguages extends ConsumerStatefulWidget {
  const SelectorLanguages({super.key});

  @override
  ConsumerState<SelectorLanguages> createState() => _SelectorLanguagesState();
}

class _SelectorLanguagesState extends ConsumerState<SelectorLanguages> {
  @override
  Widget build(BuildContext context) {
    return 
      PopupMenuButton(
        icon: const Icon(Icons.language, color: Colors.black,),
        onSelected: (String languageCode) => {
          ref.read(localeProvider.notifier).changeLocale(Locale(languageCode))
        },
        itemBuilder:  (context) => const [
          PopupMenuItem(value: 'es', child: Text('Español')),
          PopupMenuItem(value: 'en', child: Text('English')),
        ]
      );
  }
}