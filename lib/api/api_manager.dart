import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_3_news_app/api/api_constants.dart';
import 'package:project_3_news_app/api/api_end_points.dart';
import 'package:project_3_news_app/models/news_response.dart';
import 'package:project_3_news_app/models/source_response.dart';
// https://newsapi.org/v2/everything?q=bitcoin&apiKey=fb2537aade0a4e4bb8b56ccee8bec151
class ApiManager {
  static ApiManager? _instance;
  ApiManager._();
  static ApiManager getInstance(){
    _instance??=ApiManager._();
    return _instance!;
  }
  Future<SourceResponse?> getResources(String categoryId)async{
    Uri url=Uri.https(ApiConstants.baseUrl,ApiEndPoints.sourceApi,{
      'apiKey':ApiConstants.apiKey,
      'category':categoryId
    });
    try{
      var response=await http.get(url);
      var responseBody=response.body;
      var json=jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
  Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    Uri url=Uri.https(ApiConstants.baseUrl,ApiEndPoints.newsApi,{
      'apiKey':ApiConstants.apiKey,
      'sources':sourceId
    });
    var response=await http.get(url);
    var responseBody=response.body;
    var json=jsonDecode(responseBody);
    return NewsResponse.fromJson(json);
  }
}