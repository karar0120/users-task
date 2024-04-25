import 'package:flutter/material.dart';
import 'package:users_tasks/core/theming/color.dart';

ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: ColorsManager.dark),
    primaryColor: ColorsManager.mainBlue,
    scaffoldBackgroundColor: ColorsManager.gray,
    cardColor: ColorsManager.dark,
    indicatorColor: ColorsManager.gray);
