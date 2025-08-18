import 'package:flutter/material.dart';
import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/models/news_response.dart';

class NewsViewModel extends ChangeNotifier{
  List<News>? newsList;
  String? errorMessage;
  void getNewsBySourceId(String sourceId)async{
    newsList=null;
    errorMessage=null;
    notifyListeners();
    try{
        var response=await ApiManager.getNewsBySourceId(sourceId);
        if(response?.status=="error"){
            errorMessage=response!.message!;
        }else{
            newsList=response!.articles!;
        }
    }catch(e){
        errorMessage=e.toString();
    }
    notifyListeners();
  }
}