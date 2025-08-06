import 'package:flutter/material.dart';
import 'package:project_3_news_app/models/source_response.dart';
import 'package:project_3_news_app/ui/home/category_details/news/news_widget.dart';
import 'package:project_3_news_app/ui/home/category_details/source/source_name.dart';
import 'package:project_3_news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceTabWidget({super.key,required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length, 
      child:  Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex=index;
              setState(() {
                
              });
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).indicatorColor,
            dividerColor: AppColors.transparentColor,
            tabs: widget.sourcesList.map((source) {
              return SourceName(
                source: source,
                isSelected:selectedIndex==widget.sourcesList.indexOf(source) ,
              );
            },).toList()
          ),
          Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
        ],
      )
    );
  }
}