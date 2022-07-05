import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycrud/screens/sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'image/welcom.jpg',
            ),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Bienvenue !',style: GoogleFonts.oswald(
              textStyle:const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              )
            ),),
            const SizedBox(height:40),
            /*Container(
              height: MediaQuery.of(context).size.height/3,
              margin: const EdgeInsets.all(15),
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
               color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage('image/welcome.jpg',),
                  fit: BoxFit.cover
                )
              ),
            ),*/
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return SignIn();
                }));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width*1,
                margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                padding: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color:const Color(0xFF363f93),
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Text('Get Started',textAlign: TextAlign.center,style: GoogleFonts.oswald(
                    textStyle: const TextStyle(
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
      )
    );
  }
}

