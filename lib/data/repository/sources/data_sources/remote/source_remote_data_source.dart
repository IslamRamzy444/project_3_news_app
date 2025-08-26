import 'package:project_3_news_app/models/source_response.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getResources(String categoryId);
}