import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Category extends StatelessWidget {

  List<String> categories;

  @override
  Widget build(BuildContext context) {
    categories = ModalRoute.of(context).settings.arguments;

    if(categories!=null){
    return Scaffold(
      appBar: AppBar(
        title: Text("SELECT CATEGORY"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 20.0),
              child: ListTile(
                tileColor: Colors.grey.withOpacity(0.55),
                onTap: () async{

                  Response response;
                  Map data;
                  String quotetag = categories[index]=='random' ? '':categories[index];
                  response = await get('https://api.quotable.io/random?tags=$quotetag');
                  data = jsonDecode(response.body);
                  response = await get('https://api.unsplash.com/photos/random/?collections=151521?&client_id=Ul-qaLX1UyFLlgtquzfaKkrtrigQnxC7_lyizWj7SBE');
                  try {
                    data['image'] =jsonDecode(response.body)['urls']['regular'];
                  }catch(e){
                    data['image'] = 'https://th.bing.com/th/id/OIP.glyJhf2YbvvUG5nzUT4QWwDOEs?pid=Api&rs=1';
                  }

                  if(data['content']==null ){
                    data['content'] = 'SORRY, COULD NOT FETCH DATA';
                    data['author'] = '';
                    data['image'] = 'https://cdn1.iconfinder.com/data/icons/web-notifications-2/64/14._something_went_wrong_cross_crucifix_octagonal-512.png';
                    data['tags'] = ['(-.-)'];
                  }

                  Navigator.pop(context, data);

                },
                focusColor: Colors.indigo,
                hoverColor: Colors.teal,
                title: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                    child:Text(categories[index]),
                ),

              ),
            );
          }
      ),
    );
    }
  }


}
