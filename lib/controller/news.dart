import 'dart:convert';
import 'package:news_api/controller/api_keys.dart';
import 'package:news_api/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey="+ApiKey.api;
    
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            urlToImage: element['urlToImage'],
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            content: element['context'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey="+ApiKey.api;
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            urlToImage: element['urlToImage'],
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            content: element['context'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
