import 'package:injectable/injectable.dart';
import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:project_3_news_app/models/news_response.dart';
@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return apiManager.getNewsBySourceId(sourceId);
  }

}