import 'package:flutter/material.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  String icon;
  String text;
  DrawerItem({super.key,required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04*width,vertical: 0.02*height),
      child: Row(
        children: [
          Image.asset(icon,color: AppColors.whiteColor,),
          SizedBox(width: 0.02*width,),
          Text(text,style: AppStyles.bold20White,)
        ],
      ),
    );
  }
}