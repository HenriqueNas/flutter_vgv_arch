import 'package:flutter/material.dart';

part 'components.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff1B72C0),
  primary: const Color(0xff1B72C0),
  onPrimary: const Color(0xffffffff),
  primaryContainer: const Color(0xffD3E4FF),
  onPrimaryContainer: const Color(0xff001C38),
  background: const Color(0xffFCFCFF),
  onBackground: const Color(0xff001E2F),
  surface: const Color(0xffF3F4F9),
  onSurface: const Color(0xff001E2F),
  surfaceVariant: const Color(0xffEFF1F8),
  onSurfaceVariant: const Color(0xff74777F),
);

final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  inputDecorationTheme: input(lightColorScheme),
  elevatedButtonTheme: elevatedButton(lightColorScheme),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: lightColorScheme.primary,
  ),
);

final dark = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff1B72C0),
    primary: const Color(0xff1B72C0),
    onPrimary: const Color(0xffffffff),
    primaryContainer: const Color(0xffD3E4FF),
    onPrimaryContainer: const Color(0xff001C38),
    background: const Color(0xffFCFCFF),
    onBackground: const Color(0xff001E2F),
    surface: const Color(0xffF3F4F9),
    onSurface: const Color(0xff001E2F),
  ),
);
