import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_3_news_app/l10n/app_localizations.dart';
import 'package:project_3_news_app/models/news_response.dart';
import 'package:project_3_news_app/models/source_response.dart';
import 'package:project_3_news_app/providers/app_language_provider.dart';
import 'package:project_3_news_app/providers/app_theme_provider.dart';
import 'package:project_3_news_app/ui/home/category_details/news/full_article/full_article_web_view_page.dart';
import 'package:project_3_news_app/ui/home/home_screen.dart';
import 'package:project_3_news_app/utils/app_routes.dart';
import 'package:project_3_news_app/utils/app_theme.dart';
import 'package:project_3_news_app/utils/my_bloc_observer.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(SourceResponseAdapter());
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(NewsResponseAdapter());
  Hive.registerAdapter(NewsAdapter());
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