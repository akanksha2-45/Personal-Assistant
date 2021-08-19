import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_destek_sorted/Screens/Features/feature8/models/article_model.dart';

class News{
  List<ArticleModel> news = [];
  
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=44cb6e03c5a94dbb9398c067fa02cf3f";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            content: element["content"],
          );
          news.add(articleModel);
        }
      
    });
    }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news = [];
  
  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=44cb6e03c5a94dbb9398c067fa02cf3f";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            content: element["content"],
          );
          news.add(articleModel);
        }
      
    });
    }
  }
}