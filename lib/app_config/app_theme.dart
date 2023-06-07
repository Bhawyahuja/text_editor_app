import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xff1CCC5A);
  static const Color _whiteColor = Colors.white;
  static const Color _darkButtonColor = Color(0xff1D1D1D);
  static const Color _hintColor = Color(0xffA2A3AA);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: _primaryColor,
    indicatorColor: _whiteColor,
    disabledColor: _darkButtonColor,
    hintColor: _hintColor,
    cardColor: const Color(0xff2C2C36),
    useMaterial3: true,

    // appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: _whiteColor),
    ),

  );
}

/// | NAME       | SIZE |  WEIGHT |  SPACING |             |
/// |------------|------|---------|----------|-------------|
/// | headline1  | 96.0 | light   | -1.5     |             |  displayLarge
/// | headline2  | 60.0 | light   | -0.5     |             |  displayMedium
/// | headline3  | 48.0 | regular |  0.0     |             |  displaySmall
/// | headline4  | 34.0 | regular |  0.25    |             |  headlineMedium
/// | headline5  | 24.0 | regular |  0.0     |             |  headlineSmall
/// | headline6  | 20.0 | medium  |  0.15    |             |  titleLarge
/// | subtitle1  | 16.0 | regular |  0.15    |             |  titleMedium
/// | subtitle2  | 14.0 | medium  |  0.1     |             |  titleSmall
/// | body1      | 16.0 | regular |  0.5     | (bodyText1) |  bodyLarge
/// | body2      | 14.0 | regular |  0.25    | (bodyText2) |  bodyMedium
/// | button     | 14.0 | medium  |  1.25    |             |  bodySmall
/// | caption    | 12.0 | regular |  0.4     |             |  labelLarge
/// | overline   | 10.0 | regular |  1.5     |             |  labelSmall
