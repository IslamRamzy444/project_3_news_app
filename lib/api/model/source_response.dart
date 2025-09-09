
import 'package:json_annotation/json_annotation.dart';
import 'package:project_3_news_app/api/model/source.dart';
part 'source_response.g.dart';

@JsonSerializable()
class SourceResponse {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'sources')
  List<Source>? sources;
  @JsonKey(name: 'message')
  String? message;

  SourceResponse({this.status, this.sources,this.message});

  factory SourceResponse.fromJson(Map<String, dynamic> json) => _$SourceResponseFromJson(json);

  static List<SourceResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(SourceResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}

