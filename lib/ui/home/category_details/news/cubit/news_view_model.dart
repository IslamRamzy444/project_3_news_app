import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/ui/home/category_details/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates>{
  NewsViewModel():super(NewsLoadingState());
  void getNewsBySourceId(String sourceId)async{
    try{
      emit(NewsLoadingState());
      var response=await ApiManager.getNewsBySourceId(sourceId);
      if(response?.status=="error"){
        emit(NewsErrorState(errorMessage: response!.message!));
      }else{
        emit(NewsSuccessState(newsList: response!.articles!));
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}