import 'package:flutter/material.dart';
import 'package:project_3_news_app/l10n/app_localizations.dart';
import 'package:project_3_news_app/providers/app_language_provider.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04*width,vertical: 0.02*height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeAppLanguage("en");
            },
            child: languageProvider.appLanguage=="en"?selectedItem(itemName: AppLocalizations.of(context)!.english):unSelectedItem(itemName: AppLocalizations.of(context)!.english)
          ),
          InkWell(
            onTap: () {
              languageProvider.changeAppLanguage("ar");
            },
            child: languageProvider.appLanguage=="ar"?selectedItem(itemName: AppLocalizations.of(context)!.arabic):unSelectedItem(itemName: AppLocalizations.of(context)!.arabic)
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