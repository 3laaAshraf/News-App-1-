import 'package:dio/dio.dart';
import 'package:news_app/Models/article_model.dart';

class NewsService {
  //create object of Dio called dio
  final Dio dio;
  NewsService(this.dio);
//we use future because the user will wait untill the news arrive
//so we should use future if list of object
  Future<List<ArticleModel>> getGeneralNews(
      {required String CategoryName}) async {
    try {
      //  'https://newsapi.org/v2/top-headlines?sources=bbc-news,cnn,abc-news,the-verge&apiKey=0dfc292c0a914957861665642ae3b13a');
      Response response = await dio.get(
          'https://newsapi.org/v2/everything?q=$CategoryName&excludeDomains=aljazeera.net&apiKey=0dfc292c0a914957861665642ae3b13a');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];

//convert list of maps (articles) to list of objects (articleList)

      for (var element in articles) {
        ArticleModel articleObject = ArticleModel(
            img: element['urlToImage'],
            title: element['title'],
            subTitle: element['description']);

        articleList.add(articleObject);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
