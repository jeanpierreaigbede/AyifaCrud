import 'package:flutter/material.dart';


class DetailArticle extends StatefulWidget {
  const DetailArticle({Key? key}) : super(key: key);

  @override
  _DetailArticleState createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
          IconButton(
              onPressed: (){
            return Navigator.pop(context);
          },
              icon:const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,)),
          ],
        ),
      )
    );
  }
}
