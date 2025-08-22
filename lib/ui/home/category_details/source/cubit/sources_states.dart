import 'package:project_3_news_app/models/source_response.dart';

abstract class SourcesStates {}
class SourceLoadingState extends SourcesStates{}
class SourceSwitchingState extends SourcesStates{}
class SourceErrorState extends SourcesStates{
  String errorMessage;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourcesStates{
  List<Source> sourcesList;
  SourceSuccessState({required this.sourcesList});
}