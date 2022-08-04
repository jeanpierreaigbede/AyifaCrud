import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycrud/models/app_component.dart';
import 'package:http/http.dart' as http;
import 'package:mycrud/models/globals.dart' as globals;

class AddComment extends StatefulWidget {
  final int id ;
   AddComment({Key? key, required this.id}) : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {

  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 250,
            width: MediaQuery.of(context).size.width*1,
           // padding: const EdgeInsets.only(top: 10,left: 10, bottom: 10),
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              image: DecorationImage(
                image:  AssetImage("image/one.png"),
                fit: BoxFit.cover
              ),
            ),
              child:Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:const Icon(Icons.arrow_back,size: 40,color: Colors.white,),
                  ),
                  const SizedBox(width: 70,),
                  TextWidget(text: "Créer un commentaire",fontSize: 25,color: Colors.white,),
                ],
              )
          ),
          const SizedBox(height: 20,),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const  SizedBox(height: 40,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextWidget(text: "Veuillez entrer le contenu de votre commentaire : ",color: Colors.black54 ,fontSize: 20,)),
                    const  SizedBox(height: 20,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ArticleTextField(hint: "Contenu du commentaire", line: 5, controller:commentController)),
                    const  SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        if(commentController.text.trim() != '' && commentController.text.isNotEmpty  )
                        {
                            addComment(widget.id, commentController.text);
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*1,
                        margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                        padding: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color:const Color(0xFF363f93),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Text('Ajouter',textAlign: TextAlign.center,style: GoogleFonts.oswald(
                            textStyle: GoogleFonts.oswald(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                            )
                        ),),
                      ),
                    )
                  ],
                ),
              ),
          )
        ],
      )
    );
  }
  void addComment(int article_id, String comment) async{
   try
   {
     var response = await http.post(
         Uri.parse("http://post-app.herokuapp.com/api/comments"),
         body: {
           "contenu" : comment,
           "article_id" : article_id
         },
         headers: {
           'Content-type': 'application/json; charset=UTF-8',
           'Authorization': 'Bearer ${globals.tokenVar}',
         }
     );
     if(response.statusCode == 200)
       {
          print('Votre commentaire a été ajouter avec succès') ;
       }
   }
   catch(e)
    {
      print(e.toString());
    }
  }
}



