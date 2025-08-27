import 'package:hive/hive.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:project_3_news_app/models/source_response.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse?> getResources(String categoryId) async{
    var box=await Hive.openBox("sourceTab");
    var response=box.get(categoryId);
    return response;
  }

  @override
  void saveSources(SourceResponse? sourceResponse,String categoryId) async{
    var box=await Hive.openBox("sourceTab");
    await box.put(categoryId, sourceResponse);
    await box.close();
  }

}