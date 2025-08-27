
import 'package:hive/hive.dart';
import 'package:project_3_news_app/models/source_response.dart';
part 'news_response.g.dart';
@HiveType(typeId: 3)
class NewsResponse extends HiveObject{
  @HiveField(0)
  String? status;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? message;
  @HiveField(3)
  int? totalResults;
  @HiveField(4)
  List<News>? articles;

  NewsResponse({this.status,this.code,this.message,this.totalResults, this.articles});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    code=json["code"];
    message=json["message"];
    totalResults = json["totalResults"];
    articles = json["articles"] == null ? null : (json["articles"] as List).map((e) => News.fromJson(e)).toList();
  }

  static List<NewsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(NewsResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["totalResults"] = totalResults;
    if(articles != null) {
      _data["articles"] = articles?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
@HiveType(typeId: 4)
class News extends HiveObject{
  @HiveField(0)
  Source? source;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? urlToImage;
  @HiveField(6)
  String? publishedAt;
  @HiveField(7)
  String? content;

  News({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  News.fromJson(Map<String, dynamic> json) {
    source = json["source"] == null ? null : Source.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  static List<News> fromList(List<Map<String, dynamic>> list) {
    return list.map(News.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(source != null) {
      _data["source"] = source?.toJson();
    }
    _data["author"] = author;
    _data["title"] = title;
    _data["description"] = description;
    _data["url"] = url;
    _data["urlToImage"] = urlToImage;
    _data["publishedAt"] = publishedAt;
    _data["content"] = content;
    return _data;
  }
}
