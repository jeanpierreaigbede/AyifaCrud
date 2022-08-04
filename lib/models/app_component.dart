  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:mycrud/screens/detail.dart';

  class TextWidget extends StatelessWidget {
     TextWidget({Key? key, this.text , this.fontSize = 15,this.color = const Color(0xFF363f93),this.isUnderline =false }) : super(key: key);
     String ? text ;
    bool  isUnderline;
    int  fontSize ;
    Color ? color;

    @override
    Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: isUnderline ? const Color(0xFF363f93): const Color(0xFFffffff),
            width: 1
          ))
        ),
        child: Text(text!,style: GoogleFonts.oswald(
          color: color,
          fontSize: fontSize.toDouble(),
          fontWeight: FontWeight.bold
        ),),
      );
    }
  }

  class TextInput extends StatelessWidget {

   String ? textString ;
   late String yourParm ;
   bool isobscure ;
    Function(String)? onSelected;
  TextEditingController? textController = TextEditingController();
   TextInput({ this.textString , this.textController, this.isobscure =false});

    @override
    Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
        padding: const EdgeInsets.all(5),
        child: TextField(
          style:const TextStyle(
            color: Color(0xFF000000),),
          cursorColor: Color(0xFF9b9b9b),
          controller: textController,
          keyboardType: TextInputType.text,
          obscureText: isobscure ? true : false,
          decoration: InputDecoration(
             /* label: Text(label!,style:GoogleFonts.oswald(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal
              ) ,)*/
              hintText: textString,
              hintStyle: const TextStyle(
                color: Color(0xFF9b9b9b),
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              )
          ),

        ) ,
      );
    }
  }
  class ArticleTextField extends StatelessWidget {
    String hint ;
    int line ;
    TextEditingController controller = TextEditingController();
     ArticleTextField({Key? key,required this.hint,required this.line ,required this.controller }) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          maxLines: line,
          controller:controller,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle:const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
              filled: true,
              fillColor: Colors.black12,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(27)),
                borderSide: BorderSide(
                    width: 1,
                    color: Colors.white
                ),
              ),
              focusedBorder:const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.white
                  )
              )
          ),
        ),
      );
    }
  }


  class CardArticle extends StatelessWidget {
    CardArticle({Key? key, this.title, this.author, this.date, this.contenu})
        : super(key: key);
    final String? title, author, date, contenu;

    @override
    Widget build(BuildContext context) {
      final double height = MediaQuery
          .of(context)
          .size
          .height;
      final double width = MediaQuery
          .of(context)
          .size
          .width;
      return Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 2.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                //  borderRadius: BorderRadius.only(to)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: 'Titre :', color: Colors.grey,),
                  TextWidget(text: title,)
                ],
              ),
            ),
            //const SizedBox(height: 40,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: 'Author:', color: Colors.grey,),
                      TextWidget(text: author,),
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          height: 45,
                          width: width / 2.5,
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  15)),
                              color: Colors.amber
                          ),
                          child: Text('Voir les commentaires..',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.oswald(
                                fontSize: 16,
                                color: const Color(0xFF363f93),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal
                            ),),
                        ),
                        onTap: () {

                        },),
                      TextWidget(text: "publié le $date",
                        fontSize: 15,
                        color: Colors.black,),
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(

                          child: TextWidget(text: 'Ajouter un commentaire',
                            fontSize: 15,
                            isUnderline: true,),
                          onTap: () {}
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) {
                            return DetailArticle();
                          }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: height * 0.05,
                          decoration: const BoxDecoration(
                              color: Color(0xFF363f93),
                              borderRadius: BorderRadius.all(Radius.elliptical(
                                  5, 5))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Plus...', style: GoogleFonts.oswald(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  color: Colors.white
                              ),),
                              const SizedBox(width: 20,),
                              const Icon(Icons.arrow_forward, size: 30,
                                color: Colors.white,)
                            ],
                          ),
                        ),
                      )
                    ],)
                ],
              ),
            )
          ],
        ),
      );
    }

  }
