import 'package:flutter/material.dart';
import 'package:news_app/Models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({required this.AR});
  final ArticleModel AR;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              AR.img ??
                  'https://plus.unsplash.com/premium_photo-1682310096066-20c267e20605?q=80&w=1824&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            AR.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            AR.subTitle ?? '',
            maxLines: 2,
            style: const TextStyle(
                fontSize: 14, color: const Color.fromARGB(255, 129, 122, 122)),
          ),
        ],
      ),
    );
  }
}
