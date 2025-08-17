import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_3_news_app/models/news_response.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/utils/app_routes.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NewsDetails extends StatelessWidget {
  News article;
  NewsDetails({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04*width,vertical: 0.02*height),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage??'',
                placeholder: (context, url) => 
                 Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 0.02*height,),
            Text(article.content??'',style: AppStyles.medium14Black,maxLines: 4,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 0.02*height,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackColor,
                padding: EdgeInsets.symmetric(vertical: 0.03*height)
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.WebViewScreenRouteName,arguments: article);
              }, 
              child: Text(AppLocalizations.of(context)!.view_full_article,style: AppStyles.bold16White,)
            )
          ],
        ),
      ),
    );
  }
}