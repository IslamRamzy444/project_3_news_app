import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/local/news_local_data_source.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/news/repository/news_repository.dart';
import 'package:project_3_news_app/models/news_response.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsLocalDataSource newsLocalDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource,required this.newsLocalDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.mobile)|| connectivityResult.contains(ConnectivityResult.wifi)){
      var newsResponse=await newsRemoteDataSource.getNewsBySourceId(sourceId);
      newsLocalDataSource.saveNews(newsResponse,sourceId);
      return newsResponse;
    }else{
      return newsLocalDataSource.getNewsBySourceId(sourceId);
    }
  }

}