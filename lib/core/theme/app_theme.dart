
import 'package:flutter/material.dart';

import 'app_palette.dart';

class AppTheme{
  static _border(Color color) => OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10)
  );
  static final lightTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPalette.backgroundColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppPalette.backgroundColor
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(12),
          enabledBorder: _border(AppPalette.lightButtonColor),
          focusedBorder: _border(AppPalette.lightButtonColor)
      )
  );
}