import 'package:flutter/material.dart';

class App {
  static late ThemeData theme;
  static late MediaQueryData mediaQuery;

  static void init(BuildContext context) {
    theme = Theme.of(context);
    mediaQuery = MediaQuery.of(context);
  }

  static TextTheme get textTheme => theme.textTheme;

  static double get screenHeight => mediaQuery.size.height;

  static double get screenWidth => mediaQuery.size.width;

  static double get appBarHeight => AppBar().preferredSize.height;

  static double get scrollableHeight =>
      screenHeight - mediaQuery.padding.vertical - appBarHeight;
}
