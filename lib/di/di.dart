import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:project_3_news_app/data/repository/news/repository/news_repository.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:project_3_news_app/data/repository/sources/repository/source_repository.dart';

SourceRepository sourceRepositoryInjection(){
  return SourceRepositoryImpl(sourceRemoteDataSource: sourceRemoteDataSourceInjection());
}
SourceRemoteDataSource sourceRemoteDataSourceInjection(){
  return SourceRemoteDataSourceImpl(apiManager: apiManagerInjection());
}
ApiManager apiManagerInjection(){
  return ApiManager();
}
NewsRepository newsRepositoryInjection(){
  return NewsRepositoryImpl(newsRemoteDataSource: newsRemoteDataSourceInjection());
}
NewsRemoteDataSource newsRemoteDataSourceInjection(){
  return NewsRemoteDataSourceImpl(apiManager: apiManagerInjection());
}