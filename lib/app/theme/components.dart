part of 'theme.dart';

InputDecorationTheme input(ColorScheme colors) {
  return InputDecorationTheme(
    filled: true,
    fillColor: colors.surfaceVariant,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide.none,
    ),
    labelStyle: TextStyle(
      color: colors.onSurfaceVariant,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    iconColor: colors.onSurfaceVariant,
  );
}

ElevatedButtonThemeData elevatedButton(ColorScheme colors) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.disabled)
            ? colors.surface
            : colors.primaryContainer,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      foregroundColor: MaterialStateProperty.all(colors.onPrimaryContainer),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    ),
  );
}
