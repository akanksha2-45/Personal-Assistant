import 'package:flutter/material.dart';
import 'package:new_destek_sorted/Screens/Features/feature8/helper/news.dart';
import 'package:new_destek_sorted/Screens/Features/feature8/models/article_model.dart';


import 'article_view.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("DesTek", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            Text("News",
            style:TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            )
          ]
        ),
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:16),
          child: Column(
            children: <Widget>[
              Container(
                    padding: EdgeInsets.only(top:16),
                    child: ListView.builder(
                      itemCount:articles.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index){
                        return BlogTile(
                          imageUrl: articles[index].urlToImage, 
                          title: articles[index].title, 
                          desc: articles[index].description,
                          url: articles[index].url,);
                      }
                    ),
                  ),
            ]
          ),
        ),
      )
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl, @required this.title, @required this.desc, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(
            blogUrl: url,
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom:16),
        child:  Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(color: Colors.black54))
          ]
        ),
      ),
    );
  }
}