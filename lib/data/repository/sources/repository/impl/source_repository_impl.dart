import 'package:project_3_news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/sources/repository/source_repository.dart';
import 'package:project_3_news_app/models/source_response.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceRepositoryImpl({required this.sourceRemoteDataSource});
  @override
  Future<SourceResponse?> getResources(String categoryId) {
    return sourceRemoteDataSource.getResources(categoryId);
  }

}