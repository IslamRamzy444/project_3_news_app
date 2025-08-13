import 'package:flutter/material.dart';
import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/models/category.dart';
import 'package:project_3_news_app/models/source_response.dart';
import 'package:project_3_news_app/ui/home/category_details/source/source_tab_widget.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({super.key,required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getResources(widget.category.id), 
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor,),
          );
        }else if(snapshot.hasError){
          return Column(
            children: [
              Text(AppLocalizations.of(context)!.client_error,style: Theme.of(context).textTheme.headlineMedium,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor
                ),
                onPressed: () {
                  ApiManager.getResources(widget.category.id);
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
                  ApiManager.getResources(widget.category.id);
                  setState(() {
                    
                  });
                }, 
                child: Text(AppLocalizations.of(context)!.try_again,style: AppStyles.medium14White,)
              )
            ],
          );
        }
        var sourcesList=snapshot.data?.sources??[];
        return SourceTabWidget(sourcesList: sourcesList,);
      },
    );
  }
}