import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:mycrud/models/class_model.dart';

import 'package:provider/provider.dart';

Future<DataModel?> getSingleData(int id) async {
  DataModel ? result ;

  try {
    var url = Uri.parse("http://post-app.herokuapp.com/api/articles/{{${id}}}");
     var response = await http.get(
         url,
          headers: {}
     );

     if(response.statusCode == 200){
       final item = json.decode(response.body);
       print(item);
        result = DataModel.fromJson(item);
        print(item);
     }

  }
  catch(e)
  {
    print(e);
  }

  return result ;
}