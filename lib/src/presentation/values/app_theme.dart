import 'package:flutter/material.dart';

import 'palette.dart';

abstract class AppTheme {
  static final RoundedRectangleBorder _defaultButtonShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));
  static const EdgeInsets _defaultButtonPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 12);

  static final BorderRadius _defaultInputBorderRadius = BorderRadius.circular(12);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Palette.primary,
    primaryColorLight: Palette.primaryLight,
    primaryColorDark: Palette.primaryDark,
    secondaryHeaderColor: Palette.secondaryElement,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Palette.primary,
      secondary: Palette.primary,
      secondaryContainer: Palette.secondaryContainer,
      primaryContainer: Palette.primaryContainer,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Palette.primary,
      unselectedLabelColor: Palette.secondaryElement,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Palette.primary, width: 2),
        insets: EdgeInsets.symmetric(horizontal: 24),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Palette.secondaryContainer,
      border: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        // borderSide: const BorderSide(color: Palette.borderInput),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        // borderSide: const BorderSide(color: Palette.borderInput),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        borderSide: const BorderSide(color: Palette.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      hintStyle: const TextStyle(fontSize: 14, color: Palette.secondaryElement),
      labelStyle: const TextStyle(fontSize: 14, color: Palette.secondaryElement),
      alignLabelWithHint: true,
      errorMaxLines: 2,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      shape: _defaultButtonShape,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: _defaultButtonShape,
        padding: _defaultButtonPadding,
        side: const BorderSide(color: Palette.primary),
        textStyle: const TextStyle(color: Colors.black),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) => states.contains(MaterialState.disabled)
              ? Palette.primary.withOpacity(.7)
              : Palette.primary,
        ),
        shape: MaterialStateProperty.all(_defaultButtonShape),
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(color: Colors.white)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Palette.primaryLight),
        padding: MaterialStateProperty.all<EdgeInsets>(_defaultButtonPadding),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(_defaultButtonShape),
        padding: MaterialStateProperty.all<EdgeInsets>(_defaultButtonPadding),
        shadowColor: MaterialStateProperty.all(Palette.primaryLight),
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? Palette.primaryLight : Palette.primary,
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) => states.contains(MaterialState.disabled)
              ? Palette.secondaryElementOnPrimary
              : Colors.white,
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Palette.primaryContainer,
      selectedItemColor: Palette.secondary,
      unselectedItemColor: Palette.primary,
    ),
    scrollbarTheme: ScrollbarThemeData(
      // thumbColor: MaterialStateProperty.all(Palette.scrollBarThumb),
      // trackColor: MaterialStateProperty.all(Palette.scrollBarTack),
      // trackBorderColor: MaterialStateProperty.all(Palette.scrollBarTack),
      thickness: MaterialStateProperty.all(5),
      radius: const Radius.circular(5),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) =>
            states.contains(MaterialState.selected) ? Palette.primary : Palette.secondaryElement,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) =>
            states.contains(MaterialState.selected) ? Palette.primary : Palette.secondaryElement,
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? Palette.secondaryElement
            : Palette.primaryLight,
      ),
      thumbColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) =>
            states.contains(MaterialState.disabled) ? Palette.secondaryElement : Palette.primary,
      ),
    ),
  );
}
