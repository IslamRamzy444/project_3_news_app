import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_3_news_app/data/repository/sources/repository/source_repository.dart';
import 'package:project_3_news_app/ui/home/category_details/source/cubit/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates>{
  SourceRepository sourceRepository;
  int selectedIndex=0;
  SourcesViewModel({required this.sourceRepository}):super(SourceLoadingState());
  void changeIndex(int newIndex){
    selectedIndex=newIndex;
    emit(SourceSwitchingState());
  }
  void getResources(String categoryId)async{
    emit(SourceLoadingState());
    try{
      var response=await sourceRepository.getResources(categoryId);
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