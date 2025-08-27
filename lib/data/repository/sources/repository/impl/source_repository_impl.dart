import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:project_3_news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:project_3_news_app/data/repository/sources/repository/source_repository.dart';
import 'package:project_3_news_app/models/source_response.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceLocalDataSource sourceLocalDataSource;
  SourceRepositoryImpl({required this.sourceRemoteDataSource,required this.sourceLocalDataSource});
  @override
  Future<SourceResponse?> getResources(String categoryId) async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)|| connectivityResult.contains(ConnectivityResult.mobile)){
      var sourceResponse=await sourceRemoteDataSource.getResources(categoryId);
      sourceLocalDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    }else{
      return sourceLocalDataSource.getResources(categoryId);
    }
  }

}