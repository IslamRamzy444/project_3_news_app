import 'package:project_3_news_app/models/source_response.dart';

abstract class SourceRepository {
  Future<SourceResponse?> getResources(String categoryId);
}