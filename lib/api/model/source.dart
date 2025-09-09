import 'package:json_annotation/json_annotation.dart';
part 'source.g.dart';
@JsonSerializable()
class Source {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'language')
  String? language;
  @JsonKey(name: 'country')
  String? country;

  Source({this.id, this.name, this.description, this.url, this.category, this.language, this.country});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  static List<Source> fromList(List<Map<String, dynamic>> list) {
    return list.map(Source.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}