import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text("SELECT CATEGORY"),
        centerTitle: true,
      ),
      // body: ListView.builder(itemBuilder: null),
    );
  }
  // ignore: missing_return
  Future<List<String>> getCategories() async{
    Response response = await get('https://api.quotable.io/tags');
    List data = jsonDecode(response.body);
    print(data);
  }
}
