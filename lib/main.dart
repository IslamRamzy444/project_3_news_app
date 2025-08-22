import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3_news_app/providers/app_language_provider.dart';
import 'package:project_3_news_app/providers/app_theme_provider.dart';
import 'package:project_3_news_app/ui/home/category_details/news/full_article/full_article_web_view_page.dart';
import 'package:project_3_news_app/ui/home/home_screen.dart';
import 'package:project_3_news_app/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_3_news_app/utils/app_theme.dart';
import 'package:project_3_news_app/utils/my_bloc_observer.dart';
import 'package:provider/provider.dart';
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
      ChangeNotifierProvider(create: (context) => AppLanguageProvider(),)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRouteName,
      routes: {
        AppRoutes.homeScreenRouteName:(context)=>HomeScreen(),
        AppRoutes.WebViewScreenRouteName:(context)=>FullArticleWebViewPage()
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}