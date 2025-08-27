import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:project_3_news_app/data/repository/news/data_sources/local/news_local_data_source.dart';
import 'package:project_3_news_app/models/news_response.dart';
@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource{
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
    var box=await Hive.openBox("newsSources");
    var newsResponse=box.get(sourceId);
    return newsResponse;
  }
  
  @override
  void saveNews(NewsResponse? newsResponse,String sourceId) async{
    var box=await Hive.openBox("newsSources");
    await box.put(sourceId, newsResponse);
    await box.close();
  }

}