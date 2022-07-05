import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mycrud/models/app_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycrud/screens/addArticlePage.dart';
import 'package:http/http.dart' as http;
import 'package:mycrud/models/globals.dart' as globals;



class LesArticles extends StatefulWidget {
   LesArticles({Key? key}) : super(key: key);

  @override
  _LesArticlesState createState() => _LesArticlesState();
}
class _LesArticlesState extends State<LesArticles> {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
      child: ElevatedButton(
        onPressed: (){
          getData();
        }, child: Icon(Icons.add_business_sharp),
      )
      )
    );
  }
void getData() async {
  try {
    var url = Uri.parse("http://post-app.herokuapp.com/api/articles");
    var response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${globals.tokenVar}',
          'Accept': 'application/json'
        }
    );
    if (response.statusCode == 200) {
      print(response.body);
    }
    else {
      print("requete echouée");
    }
  }
  catch(e)
  {
    print(e.toString());
  }
}
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);
Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      title: Text('Les articles',
        style: GoogleFonts.oswald(
          color: Colors.black,
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold
      ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon:const Icon(Icons.arrow_back,size: 30,color: Colors.black,),
      ),
      actions: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AddArticle();
            }));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Color(0xFF363f93),
                shape: BoxShape.circle
            ),
            child: const Icon(Icons.add,size: 30,color: Colors.white,),
          ),
        )
      ],
    );
  }


}

