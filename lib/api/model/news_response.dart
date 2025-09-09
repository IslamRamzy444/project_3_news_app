
import 'package:json_annotation/json_annotation.dart';
import 'package:project_3_news_app/api/model/news.dart';
part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'totalResults')
  int? totalResults;
  @JsonKey(name: 'articles')
  List<News>? articles;
  @JsonKey(name: 'message')
  String? message;
  NewsResponse({this.status, this.totalResults, this.articles,this.message});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

  static List<NewsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(NewsResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}


