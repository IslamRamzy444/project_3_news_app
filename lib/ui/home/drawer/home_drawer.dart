import 'package:flutter/material.dart';
import 'package:project_3_news_app/providers/app_language_provider.dart';
import 'package:project_3_news_app/providers/app_theme_provider.dart';
import 'package:project_3_news_app/ui/home/drawer/widget/app_config_bottom_sheet.dart';
import 'package:project_3_news_app/ui/home/drawer/widget/drawer_item.dart';
import 'package:project_3_news_app/utils/app_assets.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
class HomeDrawer extends StatelessWidget {
  VoidCallback onDrawerItemClick;
  VoidCallback languageConfig;
  VoidCallback themeConfig;
  HomeDrawer({super.key,required this.onDrawerItemClick,required this.themeConfig,required this.languageConfig});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Container(
      color: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            width: double.infinity,
            height: 0.25*height,
            alignment: Alignment.center,
            child: Text(AppLocalizations.of(context)!.news_app,style: AppStyles.bold24Black,),
          ),
          SizedBox(height: 0.02*height,),
          InkWell(
            onTap: () {
              onDrawerItemClick();
            },
            child: DrawerItem(icon: AppAssets.homeIcon, text: AppLocalizations.of(context)!.go_to_home)
          ),
          Divider(
            thickness: 2,
            color: AppColors.whiteColor,
            indent: 0.04*width,
            endIndent: 0.04*width,
          ),
          DrawerItem(icon: AppAssets.themeIcon, text: AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              themeConfig();
            },
            child: AppConfigBottomSheet(text: themeProvider.isDarkMode()?AppLocalizations.of(context)!.dark:AppLocalizations.of(context)!.light)
          ),
          Divider(
            thickness: 2,
            color: AppColors.whiteColor,
            indent: 0.04*width,
            endIndent: 0.04*width,
          ),
          DrawerItem(icon: AppAssets.languageIcon, text: AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              languageConfig();
            },
            child: AppConfigBottomSheet(text: languageProvider.appLanguage=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic)
          )
        ],
      ),
    );
  }
}