import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/ui/home/category_details/source/cubit/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates>{
  int selectedIndex=0;
  SourcesViewModel():super(SourceLoadingState());
  void changeIndex(int newIndex){
    selectedIndex=newIndex;
    emit(SourceSwitchingState());
  }
  void getResources(String categoryId)async{
    emit(SourceLoadingState());
    try{
      var response=await ApiManager.getResources(categoryId);
      if(response?.status=="error"){
        emit(SourceErrorState(errorMessage: response!.message!));
      }else{
        emit(SourceSuccessState(sourcesList: response!.sources!));
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}