import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycrud/models/app_component.dart';
import 'package:mycrud/screens/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mycrud/screens/lesArticles.dart';
import 'package:mycrud/models/globals.dart' as globals;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45,),
               IconButton(onPressed: (){
               Navigator.pop(context);
             },
                 icon:const Icon(Icons.arrow_back,color: Colors.black,size: 30,)
             ),
              const SizedBox(height: 35,),
              TextWidget(text: " Inscrivez - vous !",isUnderline: false,fontSize: 30,),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 const SizedBox(height: 35,),
                 TextInput(textString: "Nom",textController: nameController,),
                 TextInput(textString: "Email",textController: emailController,),
                 TextInput(textString: 'Mot de passe',textController: password,),
                 TextInput(textString: "Confirmer mot de passe",textController: confirmPassword,),
                 const SizedBox(height: 35,),
                 Container(
                     margin: const EdgeInsets.symmetric(horizontal: 10),

                     child:  InkWell(
                       onTap: (){
                      if(nameController.text.isNotEmpty && nameController.text.length>=3 && emailController.text.isNotEmpty && emailController.text.contains("@") && password.text.isNotEmpty && password.text == confirmPassword.text && password.text.length>=8 ) {
                        enregistrement(nameController.text, emailController.text, password.text);
                          }
                      else
                        {
                         ScaffoldMessenger.of(context).showSnackBar( showSnackbar(" Veuillez convenablement les champs d'inscription "));
                        }
                      },
                       child: Container(
                         padding: const EdgeInsets.only(top: 5,bottom: 10,),
                         height: 60,
                         child: Text(
                           "S'inscrire ",
                           textAlign: TextAlign.center,
                           style: GoogleFonts.aBeeZee(
                               fontWeight: FontWeight.bold,
                               fontSize: 40,
                               fontStyle: FontStyle.italic,
                               color: Colors.white
                           ),
                         ),
                         decoration:const BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(35)),
                           color:  Color(0xFF363f93),
                         ),
                       ) ,
                     )

                 ),
                 const SizedBox(height: 35,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextWidget(text: " Avez-vous un compte ?",isUnderline: false,fontSize: 15,color: Colors.black38,),
                     const SizedBox(width: 10,),
                     InkWell(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context){
                           return SignIn();
                         }));
                       },
                       child: TextWidget(text: " Se connecter",isUnderline: true,fontSize: 25,),
                     )
                   ],
                 )
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
  void enregistrement( String name,String email, String pwd) async{
    var url = Uri.parse("http://post-app.herokuapp.com/api/register");

        var response = await http.post(
            url,
            body:{
             'name': name,
              'email':email,
              'password':pwd
            }
        );

        if( response.statusCode == 200 )
          {
            globals.tokenVar = (response.body);
            print(globals.tokenVar);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return LesArticles();
            }));
          }
        else {
          print("requete échouée") ; 
        }
  }

  SnackBar showSnackbar(String contenu){
    final snackbar =SnackBar(
      content: Text(contenu,),
     // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      /*action: SnackBarAction(
       // label: " OK",
        onPressed: (){},
      ),*/
      elevation: 5,
      duration: const Duration(seconds: 5),
    );
    return snackbar ;
  }
}
