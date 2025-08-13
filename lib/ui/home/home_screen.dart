import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_3_news_app/models/category.dart';
import 'package:project_3_news_app/ui/home/category_details/category_details.dart';
import 'package:project_3_news_app/ui/home/category_fragment/category_fragment.dart';
import 'package:project_3_news_app/ui/home/drawer/home_drawer.dart';
import 'package:project_3_news_app/ui/home/language/language_bottom_sheet.dart';
import 'package:project_3_news_app/ui/home/theme/theme_bottom_sheet.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory==null?AppLocalizations.of(context)!.home:selectedCategory!.title,style: Theme.of(context).textTheme.headlineMedium,),
      ),
      drawer: Drawer(
        child: HomeDrawer(onDrawerItemClick: goToHomePage,themeConfig: showThemeBottomSheet,languageConfig: showLanguageBottomSheet,),
      ),
      body:selectedCategory==null?CategoryFragment(onCategoryItemClick: selectCategory,):CategoryDetails(category: selectedCategory!,),
    );
  }

  Category? selectedCategory;

  void selectCategory(Category newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {
      
    });
  }
  void goToHomePage(){
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {
      
    });
  }
  void showThemeBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: (context) => ThemeBottomSheet(),
    );
  }
  void showLanguageBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: (context) => LanguageBottomSheet(),
    );
  }
}