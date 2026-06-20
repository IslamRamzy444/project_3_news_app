// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/utils/app_styles.dart';

class AppConfigBottomSheet extends StatelessWidget {
  String text;
  AppConfigBottomSheet({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.04*width),
      padding: EdgeInsets.symmetric(horizontal: 0.02*width,vertical: 0.02*height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.whiteColor,width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: AppStyles.medium20White,),
          Icon(Icons.arrow_drop_down_outlined,color: AppColors.whiteColor,size: 35,)
        ],
      ),
    );
  }
}