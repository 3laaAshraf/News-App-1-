import 'package:flutter/material.dart';
import 'package:news_app/Widgets/CategoryListView.dart';
import 'package:news_app/Widgets/NewsListViewBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xff282e43),
        appBar: AppBar(
          // centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(fontFamily: 'ConcertOne1', fontSize: 40),
              ),
              Text(
                'Cloud',
                style: TextStyle(
                    fontFamily: 'ConcertOne1',
                    fontSize: 40,
                    color: Colors.yellow),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategorylistView()),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 32,
              )),
              NewsListViewBuilder(
                name: 'general',
              ),
            ],
          ),
          // child: const Column(
          //   children: [
          //     Categorylist(),
          //     SizedBox(
          //       height: 32,
          //     ),
          //     Expanded(child: NewsList()),
          //   ],
          // ),
        ));
    // body: Categorylist());
  }
}
