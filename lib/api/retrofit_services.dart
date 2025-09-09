import 'package:dio/dio.dart';
import 'package:project_3_news_app/api/api_end_points.dart';
import 'package:project_3_news_app/api/model/news_response.dart';
import 'package:project_3_news_app/api/model/source_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_services.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class RetrofitServices {
  factory RetrofitServices(Dio dio, {String? baseUrl}) = _RetrofitServices;

  @GET(ApiEndPoints.sourceApi)
  Future<SourceResponse> getResources(
    @Query('apiKey') String apiKey,
    @Query('category') String categoryId
  );
  @GET(ApiEndPoints.newsApi)
  Future<NewsResponse> getNewsBySourceId(
    @Query('apiKey') String apiKey,
    @Query('sources') String sourceId
  );
}
