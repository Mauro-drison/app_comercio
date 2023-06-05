import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// THEME PROVIDERS
final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
final themeMode = StateProvider((ref) => ThemeMode.dark);

// THEMES
// light
final _theme = ThemeData(
  brightness: Brightness.light,
  //primarySwatch: Colors.green,
  appBarTheme:
      const AppBarTheme(backgroundColor: Color.fromARGB(255, 161, 71, 245)),
  colorScheme: ColorScheme.fromSeed(
      outline: const Color.fromARGB(255, 27, 182, 61),
      primary: const Color.fromARGB(255, 81, 126, 240),
      secondary: const Color.fromARGB(255, 63, 63, 63),
      tertiary: const Color.fromARGB(255, 198, 198, 198),
      error: const Color.fromARGB(255, 182, 27, 27),
      background: const Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 81, 126, 240)),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(255, 63, 63, 63)),
    displayMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w800,
        color: Color.fromARGB(255, 81, 126, 240)),
    displaySmall: TextStyle(
        fontSize: 12.0,
        fontFamily: 'Roboto',
        color: Color.fromARGB(255, 255, 255, 255)),
    bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        color: Color.fromARGB(255, 28, 28, 28)),
    bodyMedium: TextStyle(fontSize: 14.0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // ignore: deprecated_member_use
      primary: Colors.deepPurple,
      shape: const StadiumBorder(),
    ),
  ),
);

final _customTheme = CustomThemeData(
  imageSize: 150,
);

//dark
final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: _theme.appBarTheme,
  primaryColor: Colors.deepPurple,
  elevatedButtonTheme: _theme.elevatedButtonTheme,
  textTheme: _theme.textTheme.apply(
    displayColor: Colors.white,
    bodyColor: Colors.white,
  ),
);

final _customDarkTheme = CustomThemeData();

// EXTENSIONS AND CLASSES
extension CustomTheme on ThemeData {
  AssetImage imageForName(String name) {
    final path = brightness == Brightness.dark ? 'assets/dark' : 'assets/';
    return AssetImage('$path/$name');
  }

  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customTheme;
}

class CustomThemeData {
  final double imageSize;

  CustomThemeData({
    this.imageSize = 100,
  });
}
