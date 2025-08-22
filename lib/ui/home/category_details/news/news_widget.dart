import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3_news_app/models/source_response.dart';
import 'package:project_3_news_app/ui/home/category_details/news/cubit/news_states.dart';
import 'package:project_3_news_app/ui/home/category_details/news/cubit/news_view_model.dart';
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
  late NewsViewModel viewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel=NewsViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getNewsBySourceId(widget.source.id??'');
    },);
  }
  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.source.id!=widget.source.id){
      viewModel.getNewsBySourceId(widget.source.id??'');
    }
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.sizeOf(context).height;
    return BlocBuilder<NewsViewModel,NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if(state is NewsErrorState){
          return Column(
            children: [
              Text(state.errorMessage,style: Theme.of(context).textTheme.headlineMedium,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor
                ),
                onPressed: () {
                  viewModel.getNewsBySourceId(widget.source.id??'');
                }, 
                child: Text(AppLocalizations.of(context)!.try_again,style: AppStyles.medium14White,)
              )
            ],
          );
        }else if(state is NewsSuccessState){
          return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (context) => NewsDetails(article:state.newsList[index] ,),
                );
              },
              child: NewsItem(article: state.newsList[index],)
            );
          }, 
          separatorBuilder: (context, index) {
            return SizedBox(height: 0.02*height,);
          }, 
          itemCount: state.newsList.length
        );
        }else{
          return Center(child: CircularProgressIndicator(color: AppColors.greyColor,),);
        }
      },
    );
  }
}