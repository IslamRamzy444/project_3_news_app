import 'package:flutter/material.dart';
import 'package:project_3_news_app/models/news_response.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticleWebViewPage extends StatefulWidget {
  const FullArticleWebViewPage({super.key});

  @override
  State<FullArticleWebViewPage> createState() => _FullArticleWebViewPageState();
}

class _FullArticleWebViewPageState extends State<FullArticleWebViewPage> {
  WebViewController? _controller;
  late  News article;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final url=article.url;
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate( 
            onPageFinished: (_) {
              setState(() => _isLoading = false);
            },
          ),
        )
        ..loadRequest(Uri.parse(url!));
        setState(() {});
    },);
  }
  @override
  Widget build(BuildContext context) {
    article = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source?.name!??'',style: Theme.of(context).textTheme.headlineMedium,),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:_controller==null?Center(child: CircularProgressIndicator()):
      Stack(
        children: [
          WebViewWidget(controller: _controller!,),
          if(_isLoading)Center(child: CircularProgressIndicator(),)
        ],
      ) ,
    );
  }
}