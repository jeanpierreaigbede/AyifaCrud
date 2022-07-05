import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mycrud/models/app_component.dart';
import 'package:mycrud/screens/sign_up.dart';
import 'package:mycrud/screens/lesArticles.dart';
import 'package:http/http.dart' as http;
import 'package:mycrud/models/globals.dart' as globals;



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 IconButton(
                     onPressed: (){
                       Navigator.of(context).pop(context);
                     }, icon:const Icon(Icons.arrow_back,color: Color(0xFF363f93),size: 35,)
                 ),
                 const SizedBox(height: 40,),
                 TextWidget(text: "Here to Get !",fontSize: 35,isUnderline: false,),
               ],
             ),
              SingleChildScrollView(
                child: Column(
                    children: [
                      const SizedBox(height: 60,),
                      TextInput(textString: "Email",isobscure: false,textController: emailController,),
                      const SizedBox(height: 20,),
                      TextInput(textString: "Mot de passe",textController: password,isobscure: true,),
                      const  SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(text : "Se connecter",fontSize: 20,isUnderline: false,),
                          InkWell(
                            onTap: (){
                            if(emailController.text.isNotEmpty && emailController.text.contains('@') && password.text.isNotEmpty && password.text.length >= 8)
                              {
                                login(emailController.text,password.text);
                              }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(showSnackbar("Veuillez remplir conblenablement tous les"));
                            }

                            },
                            child:Container(
                              height: 80,
                              width: 80,
                              child: const Icon(Icons.arrow_forward,size: 30,color: Colors.white,),
                              decoration:const BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Color(0xFF363f93),
                              ),
                            ) ,
                          )
                        ],
                      ),
                  const  SizedBox(height: 40,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SignUp();
                            }));
                          },
                          child: TextWidget(text: "S'Inscrire ",isUnderline: true,fontSize: 20,),
                        ),
                        InkWell(
                          onTap: null,
                          child: TextWidget(text:"Mot de passe oublié",fontSize: 20,isUnderline: true,),
                        )
                      ],
                    ),
                  ),
                    ]
                  ),
              ),
            ],
          ),
        ),
    );
  }
  void login(String email, String password) async {

     var url = Uri.parse("http://post-app.herokuapp.com/api/login",);
     var response = await http.post(
       url,
       body: {
         "email" : email,
         "password" :password
       }
     );
     if( response.statusCode == 200 )
       {
         globals.tokenVar = response.body;
         print(globals.tokenVar);
         Navigator.push(context, MaterialPageRoute(builder: (context){
           return LesArticles();
         }));
       }
      }



  SnackBar showSnackbar(String contenu){
    return SnackBar(
          content: TextWidget(text: contenu,fontSize: 20,color: Colors.white,),
     // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      /*action: SnackBarAction(
        label: " OK",
        onPressed: (){
          Navigator.pop(context);
        },
      ),*/
      elevation: 5,
      duration: const Duration(seconds: 5),

    );
  }
}
