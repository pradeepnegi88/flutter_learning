import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Colors.redAccent.shade200;
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color(0XFFE1E1E1);
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;

  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: AppBarTheme(
        color: _lightPrimaryVariantColor,
        iconTheme: IconThemeData(color: _lightOnPrimaryColor)),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    iconTheme: IconThemeData(color: _iconColor),
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    appBarTheme: AppBarTheme(
        color: _darkPrimaryVariantColor,
        iconTheme: IconThemeData(color: _darkOnPrimaryColor)),
    colorScheme: ColorScheme.dark(
      primary: Colors.white24,
      secondary: _darkSecondaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      onPrimary: _darkOnPrimaryColor,
    ),
    iconTheme: IconThemeData(color: _iconColor),
    textTheme: _darkTextTheme,
  );

  static final _lightTextTheme = TextTheme(
      headline1: _lightScreenHeadingTextStyle,
      bodyText1: _lightScreenTaskNameTextStyle,
      bodyText2: _lightScreenTaskDurationTextStyle);
  static final _darkTextTheme = TextTheme(
      headline1: _darkScreenHeadingTextStyle,
      bodyText1: _darkScreenTaskNameTextStyle,
      bodyText2: _darkScreenTaskDurationTextStyle);

  static final _lightScreenHeadingTextStyle =
      TextStyle(fontSize: 48.0, color: _lightOnPrimaryColor);
  static final _lightScreenTaskNameTextStyle =
      TextStyle(fontSize: 20.0, color: _lightOnPrimaryColor);

  static final _lightScreenTaskDurationTextStyle =
      TextStyle(fontSize: 16.0, color: Colors.grey);

  static final _darkScreenHeadingTextStyle =
      _lightScreenHeadingTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final _darkScreenTaskNameTextStyle =
      _lightScreenTaskNameTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final _darkScreenTaskDurationTextStyle =
      _lightScreenTaskDurationTextStyle;
}
