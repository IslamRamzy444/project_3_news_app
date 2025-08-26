import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3_news_app/di/di.dart';
import 'package:project_3_news_app/models/category.dart';
import 'package:project_3_news_app/ui/home/category_details/source/cubit/sources_states.dart';
import 'package:project_3_news_app/ui/home/category_details/source/cubit/sources_view_model.dart';
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
  SourcesViewModel viewModel=SourcesViewModel(sourceRepository: sourceRepositoryInjection());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getResources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesViewModel,SourcesStates>(
      bloc: viewModel,
      builder: (context, state) {
        if(state is SourceErrorState){
          return Column(
            children: [
              Text(state.errorMessage,style: Theme.of(context).textTheme.headlineMedium,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor
                ),
                onPressed: () {
                  viewModel.getResources(widget.category.id);
                }, 
                child: Text(AppLocalizations.of(context)!.try_again,style: AppStyles.medium14White,)
              )
            ],
          );
        }else if(state is SourceSuccessState){
          return SourceTabWidget(sourcesList: state.sourcesList);
        }else{
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor,),
          );
        }
      },
    );
  }
}