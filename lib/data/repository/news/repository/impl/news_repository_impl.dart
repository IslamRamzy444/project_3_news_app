import 'package:project_3_news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/news/repository/news_repository.dart';
import 'package:project_3_news_app/models/news_response.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId);
  }

}