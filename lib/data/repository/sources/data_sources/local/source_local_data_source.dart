import 'package:project_3_news_app/models/source_response.dart';

abstract class SourceLocalDataSource {
  Future<SourceResponse?> getResources(String categoryId);
  void saveSources(SourceResponse? sourceResponse,String categoryId);
}