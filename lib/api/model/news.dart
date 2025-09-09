import 'package:json_annotation/json_annotation.dart';
import 'package:project_3_news_app/api/model/source.dart';
part 'news.g.dart';
@JsonSerializable()
class News {
  @JsonKey(name: 'source')
  Source? source;
  @JsonKey(name: 'author')
  String? author;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'urlToImage')
  String? urlToImage;
  @JsonKey(name: 'publishedAt')
  String? publishedAt;
  @JsonKey(name: 'content')
  String? content;

  News({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  static List<News> fromList(List<Map<String, dynamic>> list) {
    return list.map(News.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}