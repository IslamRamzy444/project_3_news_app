import 'package:hive/hive.dart';

part 'source_response.g.dart';
@HiveType(typeId: 1)
class SourceResponse extends HiveObject{
  @HiveField(0)
  String? status;
  @HiveField(1)
  List<Source>? sources;
  @HiveField(2)
  String? code;
  @HiveField(3)
  String? message;
  SourceResponse({this.status,this.code,this.message,this.sources});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    code=json["code"];
    message=json["message"];
    sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Source.fromJson(e)).toList();
  }

  static List<SourceResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(SourceResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(sources != null) {
      _data["sources"] = sources?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
@HiveType(typeId: 2)
class Source extends HiveObject{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? language;
  @HiveField(6)
  String? country;

  Source({this.id, this.name, this.description, this.url, this.category, this.language, this.country});

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  static List<Source> fromList(List<Map<String, dynamic>> list) {
    return list.map(Source.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["url"] = url;
    _data["category"] = category;
    _data["language"] = language;
    _data["country"] = country;
    return _data;
  }
}