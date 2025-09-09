import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_3_news_app/api/model/news.dart';
import 'package:project_3_news_app/providers/app_language_provider.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsItem extends StatelessWidget {
  News article;
  NewsItem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.02*width),
      padding: EdgeInsets.symmetric(horizontal: 0.02*width,vertical: 0.02*height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).indicatorColor)
      ),
      child: Column(
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
          Text(article.title??'',style: Theme.of(context).textTheme.headlineLarge,),
          SizedBox(height: 0.02*height,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("${AppLocalizations.of(context)!.by}: ${article.author??''}",style: AppStyles.medium12Grey,)),
              Text(timeago.format(DateTime.parse(article.publishedAt??''),locale: languageProvider.appLanguage),style: AppStyles.medium12Grey,)
            ],
          )
        ],
      ),
    );
  }
}