import 'package:flutter/material.dart';
import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/models/news_response.dart';
import 'package:project_3_news_app/models/source_response.dart';
import 'package:project_3_news_app/ui/home/category_details/news/news_details/news_details.dart';
import 'package:project_3_news_app/ui/home/category_details/news/news_item.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({super.key,required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.sizeOf(context).height;
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(widget.source.id??''), 
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: AppColors.greyColor,),);
        }else if(snapshot.hasError){
          return Column(
            children: [
              Text(AppLocalizations.of(context)!.client_error,style: Theme.of(context).textTheme.headlineMedium,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor
                ),
                onPressed: () {
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {
                    
                  });
                }, 
                child: Text(AppLocalizations.of(context)!.try_again,style: AppStyles.medium14White,)
              )
            ],
          );
        }else if(snapshot.data?.status!="ok"){
          return Column(
            children: [
              Text(snapshot.data!.message!,style: Theme.of(context).textTheme.headlineMedium,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor
                ),
                onPressed: () {
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {
                    
                  });
                }, 
                child: Text(AppLocalizations.of(context)!.try_again,style: AppStyles.medium14White,)
              )
            ],
          );
        }
        var newsList=snapshot.data?.articles??[];
        return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (context) => NewsDetails(article:newsList[index] ,),
                );
              },
              child: NewsItem(article: newsList[index],)
            );
          }, 
          separatorBuilder: (context, index) {
            return SizedBox(height: 0.02*height,);
          }, 
          itemCount: newsList.length
        );
      },
    );
  }
}