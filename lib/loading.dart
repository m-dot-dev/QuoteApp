import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getData() async{
      Response response;
      Map data;
      setState(() {
        display = 'Loading Quote Data';
      });
      response = await get('https://api.quotable.io/random');
      data = jsonDecode(response.body);
      setState(() {
        display = 'Quote Data Loaded';
      });
      setState(() {
        display = 'Loading Background Image';
      });
      response = await get('https://api.unsplash.com/photos/random/?collections=151521?&client_id=Ul-qaLX1UyFLlgtquzfaKkrtrigQnxC7_lyizWj7SBE');
      try {
        data['image'] =jsonDecode(response.body)['urls']['regular'];
      }catch(e){
        data['image'] = 'https://th.bing.com/th/id/OIP.glyJhf2YbvvUG5nzUT4QWwDOEs?pid=Api&rs=1';
      }
      setState(() {
        display = 'Content Load Complete';
      });
      if(data['content']==null ){
        data['content'] = 'SORRY, COULD NOT FETCH DATA';
        data['author'] = '';
        data['image'] = 'https://cdn1.iconfinder.com/data/icons/web-notifications-2/64/14._something_went_wrong_cross_crucifix_octagonal-512.png';
        data['tags'] = ['(-.-)'];
      }

      Navigator.pushReplacementNamed(context, '/home',arguments: data);
  }


  @override
  void initState() {

    super.initState();
    getData();
  }
  String display = "Loading A Random Quote";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueAccent[700],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                display,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Center(
                child: SpinKitCircle(
                    color: Colors.white,
                    size: 100.0,
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}

class LoadingBlank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Loading Quote",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Center(
                    child: SpinKitCircle(
                      color: Colors.white,
                      size: 100.0,
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}


class LoadingCategories extends StatefulWidget {
  @override
  _LoadingCategoriesState createState() => _LoadingCategoriesState();
}

class _LoadingCategoriesState extends State<LoadingCategories> {

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async{
    Response response = await get('https://api.quotable.io/tags');
    List data = jsonDecode(response.body);
    List<String> tags = ['random'];
    data.forEach((element) {
      String str = element.toString();
      int startIndex = str.indexOf('name: ')+6;
      int endIndex = str.indexOf(', __');
      tags.add(str.substring(startIndex,endIndex));
    });
    dynamic returned = await Navigator.pushNamed(context, '/categories',arguments: tags);

    Navigator.pop(context,returned);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent[700],
        body: SafeArea(
        child: Padding(
        padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Loading Quote Categories",
                  style: TextStyle(
                    color: Colors.white,
                  ),
              ),
              Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 100.0,
              )
        ),
            ],
          ),
      ),
    )
    );
  }
}
