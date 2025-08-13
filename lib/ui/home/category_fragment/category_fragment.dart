import 'package:flutter/material.dart';
import 'package:project_3_news_app/models/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_3_news_app/providers/app_theme_provider.dart';
import 'package:project_3_news_app/ui/home/category_fragment/widgets/category_item.dart';
import 'package:provider/provider.dart';
typedef OnCategoryItemClick=void Function(Category);
class CategoryFragment extends StatelessWidget {
  OnCategoryItemClick onCategoryItemClick; 
  CategoryFragment({super.key,required this.onCategoryItemClick});
  List<Category> categoriesList=[];
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    categoriesList=Category.getCategoriesList(themeProvider.isDarkMode(),context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04*width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("${AppLocalizations.of(context)!.good_morning}\n${AppLocalizations.of(context)!.intro_statement}",style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 0.02*height,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(category: categoriesList[index],index: index,)
                );
              }, 
              separatorBuilder: (context, index) {
                return SizedBox(height: 0.02*height,);
              }, 
              itemCount: categoriesList.length
            )
          )
        ],
      ),
    );
  }
}