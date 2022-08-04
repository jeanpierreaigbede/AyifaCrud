import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycrud/models/app_component.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  List<File>? files ;

  void Uploading(List<File> list){

  }

  Future getFile() async {
    var myfile = await FilePicker.platform.pickFiles( allowMultiple: true );
    if(myfile == null)
    {
      return 0 ;
    }
    else
    {
      setState((){
        files = myfile.paths.map((path) => File(path!)).toList();
      });
      Uploading(files!);
    }
  }
  @override
  Widget build(BuildContext context) {

    TextEditingController titleText = TextEditingController();
    TextEditingController authorText = TextEditingController();
    TextEditingController contenuText = TextEditingController();

    return Scaffold(
      body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width*1,
                padding: const EdgeInsets.all(20),
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("image/one.png"),
                    fit: BoxFit.cover
                  )
                ),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back,size: 40,color: Colors.white,)),
              ),
              const SizedBox(width: 80,),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextWidget(text: " Créer un article !",fontSize: 30,),
                    const SizedBox(height: 40,),

                    ArticleTextField(hint: "titre", line: 1, controller: authorText),
                    // Author
                    const SizedBox(height: 20,),
                    ArticleTextField(hint: "Contenu", line: 5, controller: contenuText),
                    const SizedBox(height: 5,),

                    const SizedBox(height: 15,),
                    /* InkWell(
                      onTap: getFile,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text( "Selectionnez vos medias",style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                            textAlign: TextAlign.center,)
                      ),
                    ),
                    const SizedBox(height: 40,),*/
                    InkWell(
                      onTap: (){
                        if( titleText.text.isNotEmpty && titleText.text.length >= 3 && authorText.text.length >= 3 && contenuText.text.isNotEmpty )
                        {
                          addArticle();
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
            ]
      )
    );
  }
  void addArticle(){

  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.white,
      title: Container(
        padding: const EdgeInsets.all(40),
        height: 150,
        decoration:const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/header.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back,size: 30,color: Colors.black,),
            ),
          ],
        ),
      ),

    );
  }


}

