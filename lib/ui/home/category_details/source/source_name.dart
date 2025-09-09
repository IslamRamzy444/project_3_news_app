import 'package:flutter/material.dart';
import 'package:project_3_news_app/api/model/source.dart';


class SourceName extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceName({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name??"",style: isSelected?Theme.of(context).textTheme.headlineLarge:Theme.of(context).textTheme.headlineSmall,);
  }
}