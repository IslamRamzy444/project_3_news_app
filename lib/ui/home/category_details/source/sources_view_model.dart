import 'package:flutter/material.dart';
import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/models/source_response.dart';

class SourcesViewModel extends ChangeNotifier{
  List<Source>? sourcesList;
  String? errorMessage;
  int selectedIndex=0;
  void changeIndex(int newIndex){
    selectedIndex=newIndex;
    notifyListeners();
  }
  void getResources(String categoryId)async{
    sourcesList=null;
    errorMessage=null;
    notifyListeners();
    try{
      var response=await ApiManager.getResources(categoryId);
      if(response?.status=="error"){
        errorMessage=response!.message!;
      }else{
        sourcesList=response!.sources!;
      }
    }catch(e){
      errorMessage=e.toString();
    }
    notifyListeners();
  }
}