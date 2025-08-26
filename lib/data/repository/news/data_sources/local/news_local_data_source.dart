import 'package:project_3_news_app/models/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}