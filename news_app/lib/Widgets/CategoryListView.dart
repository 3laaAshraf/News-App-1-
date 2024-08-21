import 'package:flutter/material.dart';
import 'package:news_app/Models/CategoryData.dart';
import 'package:news_app/Widgets/CategoryCard.dart';

class CategorylistView extends StatelessWidget {
  final List<Categorydata> listCategoryData = const [
    Categorydata(img: 'assets/science.avif', type: 'Science'),
    Categorydata(img: 'assets/technology.jpeg', type: 'Technology'),
    Categorydata(img: 'assets/sports.avif', type: 'Sports'),
    Categorydata(img: 'assets/business.avif', type: 'Business'),
    Categorydata(img: 'assets/entertaiment.avif', type: 'Entertaiment'),
    Categorydata(img: 'assets/general.avif', type: 'General'),
    Categorydata(img: 'assets/health.avif', type: 'Health'),
  ];
  const CategorylistView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategoryData.length,
        itemBuilder: (context, index) {
          return CategoryCard(CD: listCategoryData[index]);
        },
      ),
    );
  }
}
