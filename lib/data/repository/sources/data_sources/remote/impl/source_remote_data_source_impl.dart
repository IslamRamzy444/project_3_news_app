import 'package:project_3_news_app/api/api_manager.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:project_3_news_app/models/source_response.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getResources(String categoryId) {
    return apiManager.getResources(categoryId);
  }

}