import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    splashColor: Colors.transparent,
    useMaterial3: false,
    canvasColor: AppColors.white,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.dark),
      backgroundColor: AppColors.lightScaffoldBackground,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      unselectedLabelStyle: TextStyle(fontSize: 10, color: AppColors.gray),
      selectedLabelStyle: TextStyle(fontSize: 10, color: AppColors.darkPrimary),
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.lightSeedColor,
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightTertiary,
      background: AppColors.lightBackground,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFFFFFFFF),
        disabledForegroundColor: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.btnRadius),
        ),
        backgroundColor: AppColors.lightPrimary,
        disabledBackgroundColor: AppColors.lightPrimary.withOpacity(.4),
        elevation: 0,
        //padding: AppStyles.mediumPadding,
        //shadowColor: Colors.transparent,
        //minimumSize: const Size(100, 52),
        textStyle: AppStyles.elevatedButtonTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          fontFamily: 'Roboto',
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: .1,
          color: Color(0xFF007AFF),
        ),
      ),
    ),
    // textTheme: TextTheme(
    //   titleMedium: AppStyles.subhead.copyWith(
    //     color: AppColors.black,
    //   ),
    //   headlineLarge: AppStyles.headlineLarge,
    //   headlineMedium: AppStyles.headlineMedium,
    //   labelLarge: AppStyles.labelLarge,
    //   labelMedium: AppStyles.labelMedium,
    //   displayMedium: AppStyles.labelMedium.copyWith(
    //     color: Colors.black,
    //   ),
    // ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.lightSeedColor,
      surfaceTintColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      size: AppStyles.mediumIconSize,
      color: AppColors.darkSecondary,
    ),
    // snackBarTheme: SnackBarThemeData(
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //     topLeft: Radius.circular(AppStyles.mediumRadius),
    //     topRight: Radius.circular(AppStyles.mediumRadius),
    //   )),
    //   backgroundColor: AppColors.lightPrimary,
    //   actionTextColor: Colors.white,
    //   closeIconColor: Colors.white,
    //   insetPadding: AppStyles.smallPadding,
    //   contentTextStyle: AppStyles.labelMedium
    //       .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
    // ),
  );
}
