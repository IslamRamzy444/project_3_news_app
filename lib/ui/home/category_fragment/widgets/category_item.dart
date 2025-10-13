import 'package:flutter/material.dart';
import 'package:project_3_news_app/models/category.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/l10n/app_localizations.dart';
class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  CategoryItem({super.key,required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Stack(
      alignment: (index%2==0)?Alignment.bottomRight:Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(category.image),
        ),
        Container(
          width: 0.43*width,
          margin: EdgeInsets.symmetric(vertical: 0.02*height,horizontal: 0.02*width),
          padding: EdgeInsetsDirectional.only(
            start: (index%2==0)?0.02*width:0,
            end: (index%2==0)?0:0.02*width
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(84),
            color: AppColors.greyColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: (index%2==0)?TextDirection.ltr:TextDirection.rtl,
            children: [
              Text(AppLocalizations.of(context)!.view_all,style: Theme.of(context).textTheme.bodyLarge,),
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 25,
                child: Icon((index%2==0)?Icons.arrow_forward_ios:Icons.arrow_back_ios,color: Theme.of(context).indicatorColor,),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0.04*height,
          left: (index%2==0)?0.45*width:0.03*width,
          child: Text(category.title,style: Theme.of(context).textTheme.labelLarge,)
        )
      ],
    );
  }
}