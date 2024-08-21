import 'package:flutter/material.dart';
import 'package:news_app/Models/CategoryData.dart';
import 'package:news_app/Pages/category_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.CD});
  final Categorydata CD;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryPage(CategoryName: CD.type);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  //===================================here
                  image: AssetImage(CD.img),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(13),
              color: Colors.green),
          height: 105,
          width: 200,
          // color: Colors.blue,
          child: Text(
            //======================================here
            CD.type,
            style: const TextStyle(
                fontFamily: 'Jaro-Regular', color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
