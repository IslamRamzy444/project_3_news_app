import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme=ThemeMode.light;
  void changeAppTheme(ThemeMode newAppTheme){
    if(appTheme==newAppTheme){
      return;
    }
    appTheme=newAppTheme;
    notifyListeners();
  }
  bool isDarkMode(){
    return appTheme==ThemeMode.dark;
  }
}