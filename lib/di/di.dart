import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/local/impl/news_local_data_source_impl.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/local/news_local_data_source.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:project_3_news_app/data/repository/news/repository/news_repository.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/local/impl/source_local_data_source_impl.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:project_3_news_app/data/repository/sources/repository/source_repository.dart';

SourceRepository sourceRepositoryInjection(){
  return SourceRepositoryImpl(
    sourceRemoteDataSource: sourceRemoteDataSourceInjection(),
    sourceLocalDataSource: sourceLocalDataSourceInjection()
  );
}
SourceRemoteDataSource sourceRemoteDataSourceInjection(){
  return SourceRemoteDataSourceImpl(apiManager: apiManagerInjection());
}
SourceLocalDataSource sourceLocalDataSourceInjection(){
  return SourceLocalDataSourceImpl();
}
ApiManager apiManagerInjection(){
  return ApiManager();
}
NewsRepository newsRepositoryInjection(){
  return NewsRepositoryImpl(
    newsRemoteDataSource: newsRemoteDataSourceInjection(),
    newsLocalDataSource: newsLocalDataSourceInjection()
  );
}
NewsRemoteDataSource newsRemoteDataSourceInjection(){
  return NewsRemoteDataSourceImpl(apiManager: apiManagerInjection());
}
NewsLocalDataSource newsLocalDataSourceInjection(){
  return NewsLocalDataSourceImpl();
}