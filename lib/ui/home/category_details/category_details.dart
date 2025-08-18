import 'package:flutter/material.dart';
import 'package:project_3_news_app/models/category.dart';
import 'package:project_3_news_app/ui/home/category_details/source/source_tab_widget.dart';
import 'package:project_3_news_app/ui/home/category_details/source/sources_view_model.dart';
import 'package:project_3_news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_3_news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({super.key,required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourcesViewModel viewModel=SourcesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getResources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder:(context, viewModel, child) {
          if(viewModel.errorMessage!=null){
            return Column(
              children: [
                Text(viewModel.errorMessage!,style: Theme.of(context).textTheme.headlineMedium,),
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
          }else if(viewModel.sourcesList==null){
            return Center(
              child: CircularProgressIndicator(color: AppColors.greyColor,),
            );
          }else{
            return SourceTabWidget(sourcesList: viewModel.sourcesList!);
          }
        }, 
      ),
    );
  }
}