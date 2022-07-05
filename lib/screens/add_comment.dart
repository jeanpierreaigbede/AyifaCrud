import 'package:flutter/material.dart';

class AddComment extends StatefulWidget {
  const AddComment({Key? key}) : super(key: key);

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ajouter un commentaire"),
      ),
    );
  }
}







