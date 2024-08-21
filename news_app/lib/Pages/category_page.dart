import 'package:flutter/material.dart';
import 'package:news_app/Widgets/NewsListViewBuilder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({required this.CategoryName});
  final String CategoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 60),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [NewsListViewBuilder(name: CategoryName)],
        ),
      ),
    ));
  }
}
