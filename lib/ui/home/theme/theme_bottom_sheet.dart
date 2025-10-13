import 'package:flutter/material.dart';
import 'package:project_3_news_app/providers/app_theme_provider.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:project_3_news_app/l10n/app_localizations.dart';
class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04*width,vertical: 0.02*height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeAppTheme(ThemeMode.light);
            },
            child: themeProvider.isDarkMode()?unSelectedItem(itemName: AppLocalizations.of(context)!.light):selectedItem(itemName: AppLocalizations.of(context)!.light)
          ),
          InkWell(
            onTap: () {
              themeProvider.changeAppTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()?selectedItem(itemName: AppLocalizations.of(context)!.dark):unSelectedItem(itemName: AppLocalizations.of(context)!.dark)
          ),
        ],
      ),
    );
  }
  Widget selectedItem({required String itemName}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemName,style: AppStyles.bold16Purple,),
        Icon(Icons.check,color: AppColors.purpleColor,)
      ],
    );
  }
  Widget unSelectedItem({required String itemName}){
    return Text(itemName,style: AppStyles.bold16Black,);
  }
}