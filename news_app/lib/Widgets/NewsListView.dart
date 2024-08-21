import 'package:flutter/material.dart';
import 'package:news_app/Models/article_model.dart';
import 'package:news_app/Widgets/News_tile.dart';

// ignore: must_be_immutable
class NewsListView extends StatelessWidget {
  NewsListView({super.key, required this.articles});
  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length,
          (context, index) {
        return NewsTile(
          AR: articles[index],
        );
      }),
    );
  }
}
