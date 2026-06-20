import 'package:flutter/material.dart';
import 'package:project_3_news_app/l10n/app_localizations.dart';
import 'package:project_3_news_app/utils/app_assets.dart';
class Category {
  String id;
  String title;
  String image;
  Category({required this.id,required this.title,required this.image});
  static List<Category> getCategoriesList(bool isDark,BuildContext context){
    return [
      Category(
        id: "general", 
        title: AppLocalizations.of(context)!.general, 
        image: isDark?AppAssets.generalLightImage:AppAssets.generalDarkImage
      ),
      Category(
        id: "business", 
        title: AppLocalizations.of(context)!.business, 
        image: isDark?AppAssets.businessLightImage:AppAssets.businessDarkImage
      ),
      Category(
        id: "sports", 
        title: AppLocalizations.of(context)!.sports, 
        image: isDark?AppAssets.sportLightImage:AppAssets.sportDarkImage
      ),
      Category(
        id: "technology", 
        title: AppLocalizations.of(context)!.technology, 
        image: isDark?AppAssets.technologyLightImage:AppAssets.technologyDarkImage
      ),
      Category(
        id: "entertainment", 
        title: AppLocalizations.of(context)!.entertainment, 
        image: isDark?AppAssets.entertainmentLightImage:AppAssets.entertainmentDarkImage
      ),
      Category(
        id: "health", 
        title: AppLocalizations.of(context)!.health, 
        image: isDark?AppAssets.healthLightImage:AppAssets.healthDarkImage
      ),
      Category(
        id: "science", 
        title: AppLocalizations.of(context)!.science, 
        image: isDark?AppAssets.scienceLightImage:AppAssets.scienceDarkImage
      ),
    ];
  }
}