import 'package:flutter/material.dart';

@immutable
class Settings {
  const Settings({
    required this.theme,
    required this.locale,
  });

  final ThemeMode theme;

  final AppLocale locale;
}

enum AppLocale {
  es(Locale('es')),
  en(Locale('en', 'US')),
  pt(Locale('pt', 'BR'));

  const AppLocale(this.locale);

  final Locale locale;
}
