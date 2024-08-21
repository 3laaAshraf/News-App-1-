import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/article_model.dart';
import 'package:news_app/Services/news_service.dart';
import 'package:news_app/Widgets/NewsListView.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({required this.name});
  final String name;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getGeneralNews(CategoryName: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text(
                'oobs there is an error ,please try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Oswald',
                    color: Color.fromARGB(255, 159, 15, 5)),
              ),
            );
          } else {
            return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
//==================================or
// class NewsListViewBuilder extends StatefulWidget {
//   const NewsListViewBuilder({super.key});
//   @override
//   State<NewsListViewBuilder> createState() => _NewsListViewState();
// }

// class _NewsListViewState extends State<NewsListViewBuilder> {
//   List<ArticleModel> articles = [];
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     getNews();
//   }

//   Future<void> getNews() async {
//     articles = await NewsService(Dio()).getGeneralNews();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverFillRemaining(
//             hasScrollBody: false,
//             child: Center(child: CircularProgressIndicator()))
//         : articles.isNotEmpty
//             ? NewsListView(articles: articles)
//             : const SliverToBoxAdapter(
//                 child: Text(
//                   'oobs there is an error ,please try again',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 50,
//                       fontFamily: 'Oswald',
//                       color: Color.fromARGB(255, 159, 15, 5)),
//                 ),
//               );
//   }
// }
