import 'package:flutter/material.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(
        color: AppColors.blackColor
      )
    ),
    textTheme: TextTheme(
      headlineMedium: AppStyles.medium20Black,
      headlineLarge: AppStyles.bold16Black,
      headlineSmall: AppStyles.medium14Black,
      bodyLarge: AppStyles.medium24Black,
      labelLarge: AppStyles.bold32White
    )
  );

  static final ThemeData darkTheme=ThemeData(
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor
      )
    ),
    textTheme: TextTheme(
      headlineMedium: AppStyles.medium20White,
      headlineLarge: AppStyles.bold16White,
      headlineSmall: AppStyles.medium14White,
      bodyLarge: AppStyles.medium24White,
      labelLarge: AppStyles.bold32Black
    )
  );
}