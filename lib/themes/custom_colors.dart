import 'package:flutter/material.dart';

// // Define a custom MaterialColor based on #e26a05
// const MaterialColor customSwatch = MaterialColor(
//   0xFFE26A05,
//   <int, Color>{
//     50: Color(0xFFFFE4C2),
//     100: Color(0xFFFFD199),
//     200: Color(0xFFFFB866),
//     300: Color(0xFFFF9F33),
//     400: Color(0xFFFF8F1A),
//     500: Color(0xFFE26A05), // Main color
//     600: Color(0xFFCC5F04),
//     700: Color(0xFFB65404),
//     800: Color(0xFF994904),
//     900: Color(0xFF663202),
//   },
// );

Color bgDark = "#FFB866".toColor();
Color accentColor = "#FF9F33".toColor();
// ignore: non_constant_identifier_names
Color select_color = "#1FFFD9D9".toColor();
// ignore: non_constant_identifier_names
Color unselect_color = "#211E1E".toColor();
Color dividerColor = "#454545".toColor();
// Color hintColor = "#DFDFDF".toColor();
Color hintColor = Colors.grey.shade700;
Color lightBg = "#303030".toColor();
Color errorColor = "#FF6565".toColor();
Color searchHint = "#A5A4AA".toColor();
Color containerBg = "1E1E1E".toColor();

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

// setStatusBarColor(Color color) {
//   SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(statusBarColor: color));
// // }
// final ThemeData customTheme = ThemeData(
//   colorScheme: const ColorScheme.light(
//     primary: Color(0xFFFF9F33), // Primary color
//     onPrimary: Color(0xFF000000), // Suitable onPrimary color
//     secondary: Color(0xFFFFE4C2), // Complementary secondary color
//     onSecondary: Color(0xFFFFFFFF), // Suitable onSecondary color
//     background: Color(0xFFF8F9FA), // Off white background color
//     onBackground: Color(0xFF121212), // Black color for text on off white background
//     onSurface: Color.fromRGBO(255, 255, 255, 1), 
//     surface: Color(0xFFFFFFFF),

//     // Other color definitions...
//   ),
//   // Other theme properties...
// );


// final ThemeData customDarkTheme = ThemeData(
//   colorScheme: const ColorScheme.dark(
//     primary: Color(0xFFFF9F33), // Primary color
//     onPrimary: Color(0xFF000000), // Suitable onPrimary color
//     secondary: Color(0xFF3366FF), // Complementary secondary color
//     onSecondary: Color(0xFFFFFFFF), // Suitable onSecondary color
//     background: Color(0xFF1E1E1E), // Dark background color
//     onBackground: Color(0xFFFFFFFF), // White color for text on dark background
//     surface: Color.fromARGB(255, 62, 58, 58), // Dark surface color
//     onSurface: Color(0xFFFFFFFF), // White color for text on dark surface
//     // Other color definitions...
//   ),
//   // Other theme properties...
// );